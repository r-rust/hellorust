# Hello Rust

[![Build Status](https://travis-ci.org/jeroen/hellorust.svg)](https://travis-ci.org/jeroen/hellorust)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/jeroen/hellorust)](https://ci.appveyor.com/project/jeroen/hellorust)

> Minimal Example of Calling Rust from R using Cargo

Rust is a modern alternative to C and compiled rust code is ABI compatible with C. Many Rust libraries include C API headers so that the compiled rust code can be called from R/C/C++ as if it were C code.

## Cargo

The standard rust toolchain includes a great package manager `cargo` with a corresponding registry [crates.io](https://crates.io/). Cargo makes it very easy to build a rust package including all dependencies into a static library that can easily be linked into an R package.

This is perfect for R because we can compile and link all rust code at build-time without any system dependencies. Rust itself has no substantial runtime so the resulting R package is entirely self contained. Indeed, rust has been designed specifically to serve well as an embedded language.

## Prerequisites

Note that `cargo` is only needed at __build-time__. Rust has __no runtime dependencies__. To install on MacOS use homebrew:

```
brew install rust
```

And on Debian/Ubuntu:

```
sudo apt-get install cargo
```

And on Fedora / CentOS:

```
sudo yum install cargo
```

On CentOS you first need to enable EPEL via `sudo yum install epel-release`.

### Windows

In order for rust to work with R you need to install the toolchain using `rustup` and then add the `x86_64-pc-windows-gnu` and `i686-pc-windows-gnu` targets. First download [rustup-init.exe](https://win.rustup.rs/) and then install the default toolchain:

```
rustup-init.exe -y --default-host x86_64-pc-windows-gnu
```

To compile 32bit packages also add the 32bit version:

```
rustup target add i686-pc-windows-gnu
```

Our [appveyor.yml](appveyor.yml) file shows this live in action. For more about rust on Windows see [here](https://github.com/rust-lang-nursery/rustup.rs/blob/master/README.md#working-with-rust-on-windows).

## Package Structure

Simply bundle your rust code into a cargo package (just add a `Cargo.toml` file) and then invoke the build + link as shown in [src/Makevars](src/Makevars).

```
hellorust
├─ configure            ← checks if 'cargo' is installed
├─ src
│  ├─ mylib             ← bundled cargo package with your code
│  |  ├─ Cargo.toml     ← add cargo dependencies here
│  |  ├─ src            ← rust source code
│  |  └─ mylib.h        ← C headers for rust API
|  |
│  ├─ Makevars          ← Ties everything together
│  └─ wrapper.c         ← C code for R package
├─ DESCRIPTION
└─ R                    ← Standard R+C stuff
```

## Resources
 - [Rust Inside Other Languages](https://doc.rust-lang.org/1.6.0/book/rust-inside-other-languages.html) chapter from official rust documentation
 - [rustr](https://rustr.org/) is a Rust library that provides a Rust API to work with R.
 - Duncan's proof of concept: [RCallRust](https://github.com/duncantl/RCallRust)

