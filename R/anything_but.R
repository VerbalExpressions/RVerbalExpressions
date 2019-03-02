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
#'
#' @examples
#' anything_but(value = "abc")
#'
#' @references
#' Character Class: \url{https://www.regular-expressions.info/charclass.html}
#' @export
anything_but <- function(.data = NULL, value) {
  paste0(.data, "(?:[^", sanitize(value), "]*)")
}
