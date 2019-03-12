#' Match alphabetic characters.
#'
#' @description Matches letters (case insensitive) only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' alphabetic characters). Use \code{TRUE} to \emph{not} match alphabetic
#' characters.
#'
#' @examples
#' rx_alpha()
#' rx_alpha(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_alpha()
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' @export
rx_alpha <- function(.data = NULL, inverse = FALSE) {
  error_msg <-
    "
    Inverse accepts either TRUE (don't match alphabetic characters) or FALSE
    (match alphabetic characters, this is the default behavior)
    "

  switch(as.character(inverse),
    "FALSE" = paste0(.data, "[A-z]"),
    "TRUE" = paste0(.data, "[^A-z]"),
    stop(paste(strwrap(error_msg), collapse = "\n"))
  )
}
