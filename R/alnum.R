#' Match alphanumeric characters.
#'
#' @description Matches both letters (case insensitive) and numbers (a through
#' z and 0 through 9).
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param negate Invert match behavior, defaults to \code{FALSE} (match
#' alphanumeric characters). Use \code{FALSE} to \emph{not} match alphanumeric
#' characters.
#'
#' @examples
#' rx_alnum()
#' rx_alnum(negate = TRUE)
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

rx_alphanum <- function(.data = NULL, rep=NULL, mode="greedy", negate =FALSE) {
  res <- paste0(.data, parse_negate(negate, "[[:alnum:]]"), parse_rep_mode(rep, mode))
  new_rx(res)
}


#' Match alphanumeric characters together with underscore (aka. "word character")
#'
#' @description Matches both letters (case insensitive), underscore \code{_} and numbers (a through
#' z and 0 through 9).
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_alpha_num()
#'
#' # create an expression
#' x <- rx_alpha_num()
#'
#' # create input
#' string <- "Apple_1!"
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' @export
rx_alpha_num <- function(.data = NULL, rep=NULL, mode="greedy", negate =FALSE) {
  res <- paste0(.data, parse_negate(negate, "\\w", "\\W"), parse_rep_mode(rep, mode))
  new_rx(res)
}
