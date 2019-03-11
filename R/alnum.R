#' Match alphanumeric characters.
#'
#' @description Matches both letters (case insensitive) and numbers (a through
#' z and 0 through 9).
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_alnum()
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
rx_alphanum <- function(.data = NULL, rep=NULL, mode="greedy") {
  res <- paste0(.data, "[A-Za-z0-9]", parse_rep_mode(rep, mode))
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
rx_alpha_num <- function(.data = NULL, rep=NULL, mode="greedy") {
  res <- paste0(.data, "\\w", parse_rep_mode(rep, mode))
  new_rx(res)
}
