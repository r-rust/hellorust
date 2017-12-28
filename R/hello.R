#' Hello Rust!
#'
#' Invoke a rust function via C.
#'
#' @export
#' @examples hello()
#' @useDynLib hellorust hello_wrapper
hello <- function() {
  .Call(hello_wrapper)
}
