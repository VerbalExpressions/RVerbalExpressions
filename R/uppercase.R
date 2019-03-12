#' Match upper case letters.
#'
#' @description Matches upper case letters only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' upper case). Use \code{TRUE} to \emph{not} match upper case.
#'
#' @examples
#' rx_uppercase()
#' rx_uppercase(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_uppercase()
#' y <- rx_uppercase(inverse = TRUE)
#'
#' # create input
#' string <- "Apple 1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' regmatches(string, gregexpr(y, string))
#' @export
rx_uppercase <- function(.data = NULL, inverse = FALSE) {
  switch (as.character(inverse),
    "FALSE" = paste0(.data, "[A-Z]"),
    "TRUE" = paste0(.data, "[^A-Z]"),
    stop("Inverse accepts either TRUE (don't match upper case characters) or FALSE (default, match upper case characters)")
  )
}
