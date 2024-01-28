const std = @import("std");

const raylibBuild = @import("raylib_zig");

pub fn build(b: *std.Build) !void
{
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const raylibZig = b.dependency("raylib_zig", .{
        .target = target,
        .optimize = optimize,
    });

    const compile = try raylibBuild.setup(b, raylibZig, .{
        .name = "raylib-sample",
        .src = "src/main.zig",
        .target = target,
        .optimize = optimize,
    });
    if (target.result.os.tag == .windows) {
        compile.subsystem = .Windows;
    }

    // clientExe.root_module.addImport("raygui", rayguiZig.module("raygui_zig"));
    b.installArtifact(compile);

    // const runCmd = b.addRunArtifact(compile);
    // runCmd.step.dependOn(b.getInstallStep());
    // if (b.args) |args| {
    //     runCmd.addArgs(args);
    // }

    // const runStep = b.step("run", "Run");
    // runStep.dependOn(&runCmd.step);

    const testStep = b.step("test", "Test");
    _ = testStep;
}
