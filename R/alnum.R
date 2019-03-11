#' Match alphanumeric characters.
#'
#' @description Matches both letters (case insensitive) and numbers (a through
#' z and 0 through 9).
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' alphanumeric characters). Use \code{FALSE} to \emph{not} match alphanumeric
#' characters.
#'
#' @examples
#' rx_alnum()
#' rx_alnum(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_alnum()
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' @export
rx_alnum <- function(.data = NULL, inverse = FALSE) {
  switch(as.character(inverse),
         "FALSE" = paste0(.data, "[[:alnum:]]"),
         "TRUE" = paste0(.data, "[^[:alnum:]]"),
         stop("Inverse accepts either TRUE (don't match alphanumeric characters) or FALSE (default, match alphanumeric characters)")
  )
}
