#' Match any character(s) except these any (including zero) number of times.
#'
#' @description This expression will match everything except whatever characters
#' the user specifies in the \code{value} parameter. It does this by adding a
#' caret symbol \code{^} at the beginning of a character set \code{[]}. Typing
#' a caret after the opening square bracket negates the character class. The
#' result is that the character class matches any character that is not in the
#' character class. Unlike the dot, negated character classes also match
#' (invisible) line break characters. If you don't want a negated character
#' class to match line breaks, you need to include the line break characters in
#' the class.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Characters to not match
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
#'
#' @examples
#' rx_anything_but(value = "abc")
#'
#' @references
#' Character Class: \url{https://www.regular-expressions.info/charclass.html}
#' @export
rx_anything_but <- function(.data = NULL, value, mode = "greedy") {
  message_usr <- "Note: rx_anything_but() expected a value but none was given."

  switch(as.character(missing(value)),
    "TRUE" = {message(paste(strwrap(message_usr), collapse = "\n")); .data},
    "FALSE" = value
  )

  switch(mode,
    greedy = paste0(.data, "(?:[^", sanitize(value), "]*)"),
    lazy = paste0(.data, "(?:[^", sanitize(value), "]*?)"),
    stop("Please, provide valid 'mode' argument")
    )
}
