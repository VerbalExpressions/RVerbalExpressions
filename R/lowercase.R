#' Match lower case letters.
#'
#' @description Matches lower case letters only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' lower case). Use \code{FALSE} to \emph{not} match lower case.
#'
#' @examples
#' rx_lowercase()
#' rx_lowercase(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_lowercase()
#' y <- rx_lowercase(inverse = TRUE)
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' regmatches(string, gregexpr(y, string))
#' @export
rx_lowercase <- function(.data = NULL, inverse = FALSE) {
  switch (as.character(inverse),
    "FALSE" = paste0(.data, "[[:lower:]]"),
    "TRUE" = paste0(.data, "[^[:lower:]]"),
    stop("Inverse accepts either TRUE (don't match lower case characters) or FALSE (default, match lower case characters)")
  )
}
