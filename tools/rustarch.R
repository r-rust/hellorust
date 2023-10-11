# See notes in FAQ about ARM64 support:
# https://github.com/r-rust/faq#does-rust-support-windows-on-arm64-aarch64
arch <- if(grepl("aarch", R.version$platform)){
  "aarch64-pc-windows-gnullvm"
} else if(grepl("clang", Sys.getenv('R_COMPILED_BY'))){
  "x86_64-pc-windows-gnullvm"
} else if(grepl("i386", R.version$platform)){
  "i686-pc-windows-gnu"
} else {
  "x86_64-pc-windows-gnu"
}

cat(arch)
