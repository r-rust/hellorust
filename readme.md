# Hello Rust [![Build Status](https://travis-ci.org/jeroen/hellorust.svg)](https://travis-ci.org/jeroen/hellorust)

> Minimal Example of Calling Rust from R using Cargo

Rust is a modern alternative to C and compiled rust code is ABI compatible with C. Many Rust libraries include C API headers so that the compiled rust code can be called from R/C/C++ as if it were C code.

## Cargo

The standard rust toolchain includes a great package manager `cargo` with a corresponding registry [crates.io](https://crates.io/). Cargo makes it very easy to build a rust package including all dependencies into a static library that can easily be linked into an R package.

This is perfect for R because we can compile and link the entire rust package at build-time without any system dependencies. Rust itself also has no runtime dependencies beyond what C/C++ has, so the resulting R package is entirely self contained, by design. Indeed, rust has been designed specifically to serve well as an embedded language.

## Package Structure

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

