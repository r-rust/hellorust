#' Hello Rust!
#'
#' Minimal examples of calling rust functions in R via C.
#'
#' These functions call out to rust functions defined in the `myrustlib` cargo
#' crate which is embedded in this package. They return values generated in Rust,
#' such as a UTF-8 string or random number. In addition, `runthreads` is an
#' example of a multi-threaded rust function.
#'
#' @export
#' @rdname hellorust
#' @examples hello()
#' @return a value generated in Rust (a string, random number, and NULL respectively).
#' @useDynLib hellorust hello_wrapper
hello <- function() {
  .Call(hello_wrapper)
}

#' @export
#' @rdname hellorust
#' @examples random()
#' @useDynLib hellorust random_wrapper
random <- function(){
  .Call(random_wrapper)
}

#' @export
#' @rdname hellorust
#' @examples runthreads()
#' @useDynLib hellorust threads_wapper
runthreads <- function(){
  .Call(threads_wapper)
  invisible()
}
