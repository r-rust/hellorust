#' Hello Rust!
#'
#' Examples of rust functions via C.
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
