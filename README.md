# raylib-sample

A minimal example on how to use the [raylib.zig](https://github.com/kapricorn-media/raylib.zig/tree/zig_package) library via the Zig package manager.

## Build

Tested on zig version `0.12.0-dev.2063+804cee3b9`.

### Native

- `zig build`
    - `zig build run` to build and run

### Web/emscripten

Download and install the [emscripten SDK](https://emscripten.org/docs/getting_started/downloads.html), then run the same build steps above with additional flags:
- `zig build -Dtarget=wasm32-emscripten --sysroot <emscripten-sdk-path>/upstream/emscripten`
    - `zig build run -Dtarget=wasm32-emscripten --sysroot <emscripten-sdk-path>/upstream/emscripten` to build and run
