# Hello Rust

[![R build status](https://github.com/r-rust/hellorust/workflows/R-CMD-check/badge.svg)](https://github.com/r-rust/hellorust/actions?workflow=R-CMD-check)

> Minimal Examples of Using Rust Code in R

Rust is a modern alternative to C and compiled rust code is ABI compatible with C. Many Rust libraries include C API headers so that the compiled rust code can be called from R/C/C++ as if it were C code. This package shows how to do this. The [r-rust](https://github.com/r-rust) organization contains several more simple R packages interfacing with cargo crates. 

To learn more about using Rust code in R packages, also have a look at the [r-rust FAQ](https://github.com/r-rust/faq) and the [slides](https://jeroen.github.io/erum2018/) about this project presented at eRum2018!

## Package Structure

Bundle your rust code in a the embedded cargo package (see the `Cargo.toml` file) and then the [src/Makevars](src/Makevars) file is written such that R will automatically build the rust modules when the R package is installed.

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

Note that `cargo` is only needed at __build-time__. Rust has __no runtime dependencies__. The easiest way to install the latest version of Rust (including cargo) is from: https://www.rust-lang.org/tools/install

Alternatively, you may install cargo from your OS package manager:

 - Debian/Ubuntu: `sudo apt-get install cargo`
 - Fedora/CentOS*: `sudo yum install cargo`
 - MacOS: `brew install rustc`

*Note that on CentOS you first need to enable EPEL via `sudo yum install epel-release`.

## Installing Rust for R on Windows

In order for rust to work with R you need to install the toolchain using `rustup` and then add the `x86_64-pc-windows-gnu` target. First download [rustup-init.exe](https://win.rustup.rs/) and then install the default toolchain:

```
rustup-init.exe -y --default-host x86_64-pc-windows-gnu
```

Or if rust is already installed (for example on GitHub actions), you can simply add the target:

```
rustup target add x86_64-pc-windows-gnu
```

To compile 32bit packages also add the `i686-pc-windows-gnu` target, but 32-bit is no longer supported as of R 4.2.

## GitHub Actions

__Update 2023:__ This step is no longer needed because GitHub action runners now have the required Rust targets preinstalled by default.

To use GitHub actions, you can use the [standard r workflow](https://github.com/r-lib/actions/blob/HEAD/.github/workflows/check-standard.yaml) script in combination with this extra step:

```
- name: Add Rtools targets to Rust
  if: runner.os == 'Windows'
  run: |
    rustup target add i686-pc-windows-gnu
    rustup target add x86_64-pc-windows-gnu
```

## In the real world

The [gifski](https://cran.r-project.org/web/packages/gifski/index.html) package has been on CRAN since 2018, and uses this same structure. 

## More Resources
 - [r-rust FAQ](https://github.com/r-rust/faq)
 - Erum2018 [slides](https://jeroen.github.io/erum2018/) about this project presented by Jeroen
 - [Rust Inside Other Languages](https://doc.rust-lang.org/1.6.0/book/rust-inside-other-languages.html) chapter from official rust documentation
 - [extendr](https://github.com/extendr): a more advanced R extension interface using Rust
 - Duncan's proof of concept: [RCallRust](https://github.com/duncantl/RCallRust)
