#' Match a digit (0–9).
#'
#' @description The function \code{rx_digit()}looks for tabs with the following
#' expression: \code{\%\%d} and matches single digit. Plural version matches
#' specified number of digits \code{n} (equivalent to \code{rx_digit() \%>\% rx_count(n)}).
#'
#' @rdname rx_digit
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' digit characters). Use \code{FALSE} to \emph{not} match digit characters.
#'
#' @examples
#' rx_digit()
#' rx_digit(inverse = TRUE)
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
rx_digit <- function(.data = NULL, inverse = FALSE) {
  switch(as.character(inverse),
         "FALSE" = paste0(.data, "\\d"),
         "TRUE" = paste0(.data, "\\D"),
         stop("Inverse accepts either TRUE (don't match digit characters) or FALSE (default, match digit characters)")
  )
}

#' @param n Exact number of digits to match.
#' @rdname rx_digit
#' @export
rx_digits <- function(.data = NULL, n = 1, inverse = FALSE) {
  switch(as.character(inverse),
         "FALSE" = paste0(.data, "\\d", "{", n, "}"),
         "TRUE" = paste0(.data, "[^\\d", "{", n, "}]"),
         stop("Inverse accepts either TRUE (don't match digit characters) or FALSE (default, match digit characters)")
  )
}
