#' Match a digit (0–9).
#'
#' @details The function \code{rx_digit()}looks for tabs with the following expression:
#' \code{\\d} and matches single digit. Plural version matches specified number of digits \code{n}
#' (equivalent to \code{rx_digit() %>% rx_count(n)}).
#' @rdname rx_digit
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_digit()
#'
#' # create an expression
#' x <- rx_digit()
#'
#' # create input
#' string <- "1 apple"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
rx_digit <- function(.data = NULL) {
  paste0(.data, "\\d")
}

#' @param n Exact number of digits to match.
#' @rdname rx_digit
#' @export
rx_digits <- function(.data = NULL, n = 1) {
  paste0(.data, "\\d", "{", n, "}")
}
