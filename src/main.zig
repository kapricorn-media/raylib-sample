const rl = @import("raylib");
const rg = @import("raygui");

pub fn main() void {
    rl.SetConfigFlags(rl.ConfigFlags{ .FLAG_WINDOW_RESIZABLE = true });
    rl.InitWindow(800, 800, "hello world!");
    rl.SetTargetFPS(60);

    defer rl.CloseWindow();

    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        defer rl.EndDrawing();
        
        rl.ClearBackground(rl.BLACK);
        rl.DrawFPS(10, 10);

        rl.DrawText("hello world!", 100, 100, 20, rl.YELLOW);
    }
}
