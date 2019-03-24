#' Match alphanumeric characters.
#'
#' @description Matches both letters (case insensitive) and numbers (a through
#' z and 0 through 9).
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' alphanumeric characters). Use \code{TRUE} to \emph{not} match alphanumeric
#' characters.
#'
#' @examples
#' rx_alnum()
#' rx_alnum(inverse = TRUE)
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
rx_alnum <- function(.data = NULL, inverse = FALSE) {
  error_msg <-
    "
    Inverse accepts either TRUE (don't match alphanumeric characters) or FALSE
    (match alphanumeric characters, this is the default behavior)
    "

  switch(
    as.character(inverse),
    "FALSE" = paste0(.data, "[A-z0-9]"),
    "TRUE" = paste0(.data, "[^A-z0-9]"),
    stop(paste(strwrap(error_msg), collapse = "\n"))
  )
}

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

  switch(
    as.character(inverse),
    "FALSE" = paste0(.data, "[A-z]"),
    "TRUE" = paste0(.data, "[^A-z]"),
    stop(paste(strwrap(error_msg), collapse = "\n"))
  )
}

#' Match a digit (0–9).
#'
#' @description The function \code{rx_digit()}looks for tabs with the following
#' expression: \code{\%\%d} and matches single digit. Plural version matches
#' specified number of digits \code{n} (equivalent to \code{rx_digit() \%>\% rx_count(n)}).
#'
#' @rdname rx_digit
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' digit characters). Use \code{TRUE} to \emph{not} match digit characters.
#'
#' @examples
#' rx_digit()
#' rx_digit(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_digit()
#'
#' # create input
#' string <- "1 apple"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
rx_digit <- function(.data = NULL, inverse = FALSE) {
  switch(
    as.character(inverse),
    "FALSE" = paste0(.data, "\\d"),
    "TRUE" = paste0(.data, "\\D"),
    stop("Inverse accepts either TRUE (don't match digit characters) or FALSE (default, match digit characters)")
  )
}

#' Match a line break.
#'
#' @description This expression looks for line breaks, both Unix and Windows
#' style by using the appropriate \emph{non printable characters}.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_line_break()
#'
#' # create an expression
#' x <- rx_line_break()
#'
#' # create input
#' string <- "foo\nbar"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#'
#' @references
#' Unix style: \url{https://codepoints.net/U+000A}
#'
#' Windows style: \url{https://codepoints.net/U+000D}
#'
#' Non printable character: \url{https://www.regular-expressions.info/nonprint.html}
#' @rdname rx_line_break
#' @export
rx_line_break <- function(.data = NULL) {
  paste0(.data, "(\\r\\n|\\r|\\n)")
}

#' Match punctuation characters.
#'
#' @description Matches punctuation characters only:
#' \code{! \" # $ \% & ' ( ) * + , - . / : ; < = > ? @ [ \\ ] ^ _ ` { | } ~}.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' punctuation). Use \code{TRUE} to \emph{not} match punctuation.
#'
#' @examples
#' rx_punctuation()
#' rx_punctuation(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_punctuation()
#'
#' # create input
#' string <- 'Apple 1!'
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#'
#' # dont extract punctuation
#' y <- rx_punctuation(inverse = TRUE)
#' regmatches(string, gregexpr(y, string))
#' @export
rx_punctuation <- function(.data = NULL, inverse = FALSE) {
  switch(
    as.character(inverse),
    "FALSE" = paste0(.data, "[[:punct:]]"),
    "TRUE" = paste0(.data, "[^[:punct:]]"),
    stop("Inverse accepts either TRUE (don't match punctuation) or FALSE (default, match punctuation)")
  )
}

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
  switch(
    as.character(inverse),
    "FALSE" = paste0(.data, " "),
    "TRUE" = paste0(.data, "[^ ]"),
    stop("Inverse accepts either TRUE (don't match space) or FALSE (default, match space)")
  )
}

#' Match a tab character.
#'
#' @details This function is looks for tabs with the following
#' expression: \code{\\t}
#' \enumerate{
#'   \item Tab character: \url{https://codepoints.net/U+0009}
#' }
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' tabs). Use \code{TRUE} to \emph{not} match tabs.
#'
#' @examples
#' rx_tab()
#' rx_tab(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_tab()
#'
#' # create input
#' string <- "foo\tbar"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
rx_tab <- function(.data = NULL, inverse = FALSE) {
  switch(
    as.character(inverse),
    "FALSE" = paste0(.data, "\\t"),
    "TRUE" = paste0(.data, "[^\\t]"),
    stop("Inverse accepts either TRUE (don't match tabs) or FALSE (default, match tabs)")
  )
}

#' Match a whitespace character.
#'
#' @details Match a whitespace character (one of space, tab, carriage return,
#' new line, vertical tab and form feed).
#' \enumerate{
#'   \item space: \url{https://codepoints.net/U+0020}
#'   \item tab: \url{https://codepoints.net/U+0009}
#'   \item carriage return: \url{https://codepoints.net/U+000D}
#'   \item new line: \url{https://codepoints.net/U+000}
#'   \item vertical tab: \url{https://codepoints.net/U+000B}
#'   \item form feed: \url{https://codepoints.net/U+000C}
#' }
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' whitespace). Use \code{TRUE} to \emph{not} match whitespace.
#'
#' @examples
#' # match whitespace, default
#' rx_whitespace()
#'
#' # dont match whitespace
#' rx_whitespace(inverse = TRUE)
#'
#' # create an expression
#' x <- rx_whitespace()
#'
#' # create input
#' string <- "1 apple"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#'
#' # extract no whitespace by inverting behavior
#' y <- rx_whitespace(inverse = TRUE)
#' regmatches(string, gregexpr(y, string))
#' @export
rx_whitespace <- function(.data = NULL, inverse = FALSE) {
  switch(as.character(inverse),
         "FALSE" = paste0(.data, "\\s"),
         "TRUE" = paste0(.data, "[^ \t\r\n]"),
         stop("Inverse accepts either TRUE (don't match whitespace) or FALSE (default, match whitespace)")
  )
}

#' Match a word.
#'
#' @description Match a word—a string of word characters (a–z, A–Z, 0–9 or _).
#' This function is looks for tabs with the following expression: \code{\\w+}
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_word()
#'
#' # create an expression
#' x <- rx_word()
#'
#' # create inputs
#' string1 <- "foo_bar"
#' string2 <- "foo-bar"
#'
#' # extract matches
#' regmatches(string1, regexpr(x, string1))
#' regmatches(string2, regexpr(x, string2)) # doesn't match -
#' @export
rx_word <- function(.data = NULL) {
  paste0(.data, "\\w+")
}

#' Match a word character.
#'
#' @description Match a word character (a–z, A–Z, 0–9 or _).
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_word_char()
#'
#' # Same as rx_word()
#'x <- rx_word_char() %>%
#'  rx_one_or_more()
#'
#' @export
rx_word_char<- function(.data = NULL){
  paste0(.data, "\\w")
}

#' Match lower case letters.
#'
#' @description Matches lower case letters only.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' lower case). Use \code{TRUE} to \emph{not} match lower case.
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
  switch(
    as.character(inverse),
    "FALSE" = paste0(.data, "[a-z]"),
    "TRUE" = paste0(.data, "[^a-z]"),
    stop("Inverse accepts either TRUE (don't match lower case characters) or FALSE (default, match lower case characters)")
  )
}

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
  switch(
    as.character(inverse),
    "FALSE" = paste0(.data, "[A-Z]"),
    "TRUE" = paste0(.data, "[^A-Z]"),
    stop("Inverse accepts either TRUE (don't match upper case characters) or FALSE (default, match upper case characters)")
  )
}
