const std = @import("std");

const raylib = @import("deps/raylib.zig/build.zig");
const raygui = @import("deps/raygui.zig/build.zig");

pub fn build(b: *std.Build) void
{
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "raylib-sample",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    raylib.addTo(b, exe, target, optimize);
    raygui.addTo(b, exe, target, optimize);
    b.installArtifact(exe);

    const runCmd = b.addRunArtifact(exe);
    runCmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        runCmd.addArgs(args);
    }

    const runStep = b.step("run", "Run the app");
    runStep.dependOn(&runCmd.step);
}
