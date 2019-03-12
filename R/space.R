#' Match a space character.
#'
#' @description Matches a space character.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' space). Use \code{TRUE} to \emph{not} match space.
#'
#' @examples
#' # match space, default
#' rx_space()
#'
#' # dont match space
#' rx_space(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_space()
#'
#' # create input
#' string <- "1 apple\t"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#'
#' # extract no whitespace by inverting behavior
#' y <- rx_space(inverse = TRUE)
#' regmatches(string, gregexpr(y, string))
#' @export
rx_space <- function(.data = NULL, inverse = FALSE) {
  switch(as.character(inverse),
         "FALSE" = paste0(.data, " "),
         "TRUE" = paste0(.data, "[^ ]"),
         stop("Inverse accepts either TRUE (don't match space) or FALSE (default, match space)")
  )
}
