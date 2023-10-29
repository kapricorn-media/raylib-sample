const std = @import("std");

const raylib = @import("raylib");
const raygui = @import("raygui");

pub fn main() void
{
    raylib.SetConfigFlags(.{
        .FLAG_WINDOW_RESIZABLE = true
    });

    raylib.InitWindow(800, 800, "hello world!");
    defer raylib.CloseWindow();

    raylib.SetTargetFPS(60);

    while (!raylib.WindowShouldClose()) {
        raylib.BeginDrawing();
        defer raylib.EndDrawing();
        
        raylib.ClearBackground(raylib.WHITE);

        raylib.DrawText("Hello, world!", 10, 10, 20, raylib.BLACK);
        if (raylib.IsKeyDown(.KEY_K)) {
            raylib.DrawText("Key pressed.", 10, 200, 20, raylib.BLACK);
        }

        const button = raygui.GuiButton(.{ .x = 10, .y = 100, .width = 200, .height = 50 }, "Button");
        if (button != 0) {
            std.debug.print("pressed\n", .{});
        }
    }
}
