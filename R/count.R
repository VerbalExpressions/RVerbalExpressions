#' Match the previous stuff exact number of times.
#'
#' @description This function simply adds a \code{{n}} to the end of the expression.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param n Number of times previous expression shall be repeated. For exact
#' number of repetitions use single number. Use sequence \code{min:max} or
#' vector of \code{c(min, max)} to denote range of repetitions. To create ranges
#' unbounded on one end, pass on a vector with either first of second element
#' equal to \code{NA}, e.g. \code{c(NA, 3)}, up to 3 repetitions.
#'
#' @examples
#' rx_count()
#'
#' # create an expression
#' x <- rx_find(value = "a") %>%
#'   rx_count(3)
#'
#' # create input
#' input <- "aaa"
#'
#' # extract match
#' regmatches(input, regexpr(x, input))
#'
#' @export
rx_count <- function(.data = NULL, n = 1) {
 parse_rep(n)
}
