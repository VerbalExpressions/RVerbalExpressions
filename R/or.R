#' Alternatively, match another expression.
#'
#' @description Expression to match instead. If both expressions exists, both
#' will be returned. Note that this expression requires a verbal expression for
#' the value parameter, see the example below. This may change in the future as
#' I'd like to avoid nesting a function call in \code{or()}.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value A verbal expression
#'
#' @examples
#' # create an expression
#' x <- rx_find(value = "foo") %>%
#'   rx_or(rx_find(value = "bar"))
#'
#' # create strings
#' string1 <- "foo!"
#' string2 <- "bar!"
#'
#' # extract matches
#' regmatches(string1, gregexpr(x, string1))[[1]]
#' regmatches(string2, gregexpr(x, string2))[[1]]
#'
#' @export
rx_or <- function(.data, value) {
  # Not sure if I like this. I would prefer:
  #
  # find(value = "foo") %>%
  #   or() %>%
  #   find("bar")
  #
  # Rather than having to nest a rule inside of or(), maybe use glue?
  paste0("(?:", .data, ")|(?:", value, ")")
}
