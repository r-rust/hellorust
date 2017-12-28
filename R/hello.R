#' Hello Rust!
#'
#' Examples of rust functions via C.
#'
#' @export
#' @rdname hellorust
#' @examples hello()
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
