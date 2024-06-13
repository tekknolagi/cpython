#!/usr/bin/env bash

export PATH="/home/max/Documents/dev/wasmtime/target/release/:$PATH"

set -eux
python3.12 Tools/wasm/wasm_build.py wasi build > /dev/null

PYTHONPATH=$(pwd)/builddir/wasi/build/lib.wasi-wasm32-3.14:$(pwd)/Lib \
wizer -r _start=wizer_resume \
  --dir . \
  --allow-wasi \
  --wasm-bulk-memory true \
  -o builddir/wasi/python.wizer.wasm \
  builddir/wasi/python.wasm

wasmtime compile \
  -o builddir/wasi/python.wizer.cwasm \
  builddir/wasi/python.wizer.wasm
