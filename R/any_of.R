#' Match any of these characters exactly once.
#'
#' @description Constructs a \emph{character class}, sometimes called a
#' \emph{character set}. With this particular expression, you can tell the
#' regex engine to match only one out of several characters. It does this by
#' simply placing the characters you want to match between square brackets.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param value Expression to optionally match
#'
#' @examples
#' rx_any_of(value = "abc")
#'
#' # create an expression
#' x <- rx_any_of(value = "abc")
#'
#' grepl(x, "c") # should be true
#' grepl(x, "d") # should be false
#'
#' y <- rx() %>%
#'   rx_find("gr") %>%
#'   rx_any_of("ae") %>%
#'   rx_find("y")
#'
#' regmatches("gray", regexec(y, "gray"))[[1]]
#' regmatches("grey", regexec(y, "grey"))[[1]]
#'
#' @references
#' Character class: \url{https://www.regular-expressions.info/charclass.html}
#' @export
rx_any_of <- function(.data = NULL, value) {
  message_usr <- "Note: rx_any_of() expected a value but none was given."

  switch(
    as.character(missing(value)),
    "TRUE" = {message(paste(strwrap(message_usr), collapse = "\n")); .data},
    "FALSE" = paste0(.data, "[", sanitize(value), "]")
  )
}
