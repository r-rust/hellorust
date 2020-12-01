# Hello Rust

[![R build status](https://github.com/r-rust/hellorust/workflows/R-CMD-check/badge.svg)](https://github.com/r-rust/hellorust/actions?workflow=R-CMD-check)

> Minimal Example of Calling Rust from R using Cargo

Rust is a modern alternative to C and compiled rust code is ABI compatible with C. Many Rust libraries include C API headers so that the compiled rust code can be called from R/C/C++ as if it were C code.

The [r-rust](https://github.com/r-rust) organization contains several example R packages interfacing with Rust. Also have a look at the [slides](https://jeroen.github.io/erum2018/) about this project presented at eRum2018!

## Package Structure

We simply bundle the rust code into a cargo package (see the `Cargo.toml` file) and then the [src/Makevars](src/Makevars) file is written such that R will automatically build the rust modules when the R package is installed.

```
hellorust
├─ configure            ← checks if 'cargo' is installed
├─ src
│  ├─ myrustlib            ← bundled cargo package with your code
│  |  ├─ Cargo.toml          ← cargo dependencies and metadata
│  |  ├─ src                 ← rust source code
│  |  └─ api.h               ← C headers for exported rust API
|  |
│  ├─ Makevars          ← Ties everything together
│  └─ wrapper.c         ← C code for R package
├─ DESCRIPTION
└─ R                    ← Standard R+C stuff
```

## Installing this package

If Rust is available, clone this repository and run the regular `R CMD INSTALL` command:

```
R CMD INSTALL hellorust
```

Alternatively, to download and install from within R itself:

```r
# install.packages("remotes")
remotes::install_github("r-rust/hellorust")
```

## What is Cargo

The standard rust toolchain includes a great package manager `cargo` with a corresponding registry [crates.io](https://crates.io/). Cargo makes it very easy to build a rust package including all dependencies into a static library that can easily be linked into an R package.

This is perfect for R because we can compile and link all rust code at build-time without any system dependencies. Rust itself has no substantial runtime so the resulting R package is entirely self contained. Indeed, rust has been designed specifically to serve well as an embedded language.

## Installing Rust on Linux / MacOS

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

And on Arch:

```
sudo pacman -Sy cargo
```

On CentOS you first need to enable EPEL via `sudo yum install epel-release`.

## Installing Rust for R on Windows

In order for rust to work with R you need to install the toolchain using `rustup` and then add the `x86_64-pc-windows-gnu` and `i686-pc-windows-gnu` targets. First download [rustup-init.exe](https://win.rustup.rs/) and then install the default toolchain:

```
rustup-init.exe -y --default-host x86_64-pc-windows-gnu
```

To compile 32bit packages also add the i686 target:

```
rustup target add i686-pc-windows-gnu
```

## GitHub Actions

To use GitHub actions, you can use the [standard r workflow](https://github.com/r-lib/actions/blob/master/.github/workflows/check-standard.yaml) script in combination with this extra step:

```
- name: Install Rust
  uses: actions-rs/toolchain@v1
  with:
      toolchain: stable
      override: true

- name: Add Rtools targets to Rust
  if: runner.os == 'Windows'
  run: |
    rustup target add i686-pc-windows-gnu
    rustup target add x86_64-pc-windows-gnu
```

## In the real world

The [gifski](https://cran.r-project.org/web/packages/gifski/index.html) package has been on CRAN since 2018, and uses this same structure. 

However, do note that for the CRAN release we used a hack in `src/Makevars.win` to download a precompiled version of the gifski crate on Windows, because the CRAN winbuilder did not have a Rust compiler installed.

## More Resources
 - Erum2018 [slides](https://jeroen.github.io/erum2018/) about this project presented by Jeroen
 - [Rust Inside Other Languages](https://doc.rust-lang.org/1.6.0/book/rust-inside-other-languages.html) chapter from official rust documentation
 - [rustr](https://rustr.org/) is a Rust library that provides a Rust API to work with R.
 - Duncan's proof of concept: [RCallRust](https://github.com/duncantl/RCallRust)
