const std = @import("std");

const raylibBuild = @import("raylib_zig");

pub fn build(b: *std.Build) !void
{
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Set up the raylib-enabled compile step.
    const raylibZig = b.dependency("raylib_zig", .{
        .target = target,
        .optimize = optimize,
    });
    const compile = try raylibBuild.setup(b, raylibZig, .{
        .name = "raylib-sample",
        .src = "src/main.zig",
        .target = target,
        .optimize = optimize,
        .createRunStep = true,
    });
    if (target.result.os.tag == .windows) {
        compile.subsystem = .Windows;
    }

    // You can add other 3rd party libraries to the compile step.
    const depModule = b.createModule(.{
        .root_source_file = .{.path = "src/dep.zig"},
        .target = target,
        .optimize = optimize,
    });
    compile.root_module.addImport("dep", depModule);

    // You can choose to add the compile step to the default install, or do something else.
    b.installArtifact(compile);

    const testStep = b.step("test", "Test");
    _ = testStep;
}
