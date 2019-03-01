#' Match any character(s) any (including zero) number of times.
#'
#' @details This function is slighly different than \code{start_of_line()} and
#' others because it has a single argument \code{.data} which allows the user to
#' pass a value to to it. This is meant to allow \code{dplyr} chains to
#' function properly as \code{.data} defaults to \code{NULL} and will pull
#' the data from the previous step in the chain. No \code{value} argument is
#' associated with this function because the expression is meant to match
#' anything.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' anything()
#'
#' x <- start_of_line() %>%
#'   anything() %>%
#'   end_of_line()
#'
#' grepl(x, "anything!") # this should be true
#' @export
anything <- function(.data = NULL) {
  paste0(.data, "(?:.*)")
}
