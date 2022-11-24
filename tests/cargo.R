print_cargo <- function(){
  home <- Sys.getenv(ifelse(.Platform$OS.type == 'windows', 'USERPROFILE', 'HOME'))
  cargodir <- file.path(home, '.cargo', 'bin')
  Sys.setenv(PATH = paste(cargodir, Sys.getenv('PATH'), sep = .Platform$path.sep))
  cargo <- Sys.which('cargo')
  if(nchar(cargo)){
    cat("Found cargo in:", cargo, "\n")
    system("cargo --version", wait = TRUE)
  } else {
    cat("Cargo not found on the path\n")
  }
  invisible()
}
print_cargo()
