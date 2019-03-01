#' Match any of these characters exactly once.
#'
#' @details This function is slighly different than \code{start_of_line()}
#' because it has the additional argument \code{.data} which allows the user to
#' pass a value to to it. This is meant to allow \code{dplyr} chains to
#' function properly as \code{.data} defaults to \code{NULL} and will pull
#' the data from the previous step in the chain.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Expression to optionally match
#'
#' @examples
#' any_of(value = "abc")
#'
#' # create an expression
#' x <- any_of(value = "abc")
#'
#' grepl(x, "c") # should be true
#' grepl(x, "d") # should be false
#' @export
any_of <- function(.data = NULL, value) {
  paste0(.data, "[", sanitize(value), "]")
}
