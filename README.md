A custom image for build and test `XXX-pc-windows-msvc` targets with [cross](https://github.com/cross-rs/cross).

The build environment is prepared using [msvc-wine-rust](https://github.com/est31/msvc-wine-rust).

# Dependencies

- [rustup](https://rustup.rs)
- [cross](https://github.com/cross-rs/cross) with supported container engine, docker for example.
- If you're going to use `cross test` or `cross run`, a `binfmt`-enabled linux kernel is also required. `binfmt` related files are built in docker image, you don't have to install it in host environment.

# Usage (docker for example)

```sh
# first, generate da image
cat Dockerfile | docker build -t cross-msvc -

# setup environment variables
export CROSS_TARGET_X86_64_PC_WINDOWS_MSVC_IMAGE=cross-msvc
export CROSS_TARGET_I686_PC_WINDOWS_MSVC_IMAGE=cross-msvc

# happy cross compiling
cross build --target x86_64-pc-windows-msvc

# you have to configure binfmt before cross testing
prepare_xtest.sh

# happy cross testing
cross test --target x86_64-pc-windows-msvc
```

# Why not provide docker image directly

The images uses msvc libraries, which requires you to read and agree their license agreements.

# License

WTFPL
