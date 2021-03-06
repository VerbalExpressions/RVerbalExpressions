#' Match the previous stuff one or more times.
#'
#' @description This function simply adds a + to the end of the expression.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
#'
#' @examples
#' rx_one_or_more()
#'
#' # create an expression
#' x <- rx() %>%
#'   rx_find("a") %>%
#'   rx_one_or_more()
#'
#' # create input
#' input <- "aaa"
#'
#' # extract match
#' regmatches(input, regexpr(x, input))
#' @export
rx_one_or_more <- function(.data = NULL, mode = "greedy") {
  switch(
    mode,
    greedy = new_rx(paste0(.data, "+")),
    lazy = new_rx(paste0(.data, "+?")),
    stop("Please, provide valid 'mode' argument")
  )
}

#' Match the previous stuff zero or many times.
#'
#' @description This function simply adds a * to the end of the expression.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
#'
#' @examples
#' rx_none_or_more()
#'
#' # create an expression
#' x <- rx() %>%
#'   rx_find("a") %>%
#'   rx_none_or_more()
#'
#' # create input
#' input <- "aaa"
#'
#' # extract match
#' regmatches(input, regexpr(x, input))
#' @export
rx_none_or_more <- function(.data = NULL, mode = "greedy") {
  switch(
    mode,
    greedy = new_rx(paste0(.data, "*")),
    lazy = new_rx(paste0(.data, "*?")),
    stop("Please, provide valid 'mode' argument")
  )
}

#' Match the previous group any number of times.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Item to match
#' @param min Minimum number of times it should be present
#' @param max Maximum number of times it should be present
#' @export
rx_multiple <- function(.data = NULL, value = NULL, min = NULL, max = NULL) {
  if(!is.null(value)) {
    value <- new_rx(paste0("(", sanitize(value), ")"))
  }

  if(is.null(min) & is.null(max)) {
    rep <- paste0("*")
  } else if(!is.null(min) & is.null(max)) {
    rep <- paste0("{", min, ",}")
  } else if(!is.null(min) & !is.null(max)) {
    rep <- paste0("{", min, ",", max, "}")
  } else if(is.null(min) & !is.null(max)) {
    rep <- paste0("{,", max, "}")
  }

  paste0(.data, value, rep)
  paste0(.data, value, rep)
}
