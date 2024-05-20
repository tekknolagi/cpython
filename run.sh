#!/usr/bin/env bash
export PATH="/home/max/Documents/dev/wasmtime/target/release/:$PATH"
set -eux
wasmtime run --wasm max-wasm-stack=8388608 \
  --wasi preview2 \
  --dir /home/max/Documents/dev/cpython::/ \
  --dir /home/max/Documents/dev/cpython/builddir/wasi/build/lib.wasi-wasm32-3.14 \
  --env PYTHONPATH=/builddir/wasi/build/lib.wasi-wasm32-3.14:/Lib \
  --allow-precompiled \
  builddir/wasi/python.wizer.cwasm
