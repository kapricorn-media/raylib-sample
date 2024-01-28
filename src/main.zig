const std = @import("std");

const rl = @import("raylib");
const rg = @import("raygui");

const dep = @import("dep"); // example external dependency

pub fn main() void {
    rl.SetConfigFlags(rl.ConfigFlags{ .FLAG_WINDOW_RESIZABLE = true });
    rl.InitWindow(800, 800, "hello world!");
    rl.SetTargetFPS(60);

    defer rl.CloseWindow();

    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.BLACK);
        rl.DrawFPS(10, dep.add(5, 5));

        rl.DrawText("hello world!", 100, 100, 20, rl.YELLOW);

        if (rg.GuiButton(.{ .x = 100, .y = 200, .width = 200, .height = 100 }, "press me!") != 0) {
            std.debug.print("pressed\n", .{});
        }
    }
}
