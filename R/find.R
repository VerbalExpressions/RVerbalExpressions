#' Match an expression (alias for \code{then()}).
#'
#' @description This function searches for a specific pattern.
#'
#' @details This function is slighly different than \code{start_of_line()}
#' because it has the additional argument \code{.data} which allows the user to
#' pass a value to to it. This is meant to allow \code{dplyr} chains to
#' function properly as \code{.data} defaults to \code{NULL} and will pull
#' the data from the previous step in the chain.
#'
#' Alias for then. Meant for semantics when used at the beginning of a verbal
#' expression. For example, \code{find(value = 'foo')} is more readable than
#' \code{then(value = 'foo')}.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Expression to match
#'
#' @examples
#' find(value = "apple")
#'
#' # create expression
#' x <- start_of_line() %>%
#'   find("apple") %>%
#'   end_of_line()
#'
#' grepl(x, "apples") # should be false
#' grepl(x, "apple")  # should be true
#' @export
find <- function(.data = NULL, value) {
  paste0(.data, "(?:", sanitize(value), ")")
}
