#' Match the expression only if it appears from beginning of line.
#'
#' @description Control whether to match the expression only if it appears from
#' the beginning of the line.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param enable Whether to enable this behavior, defaults to \code{TRUE}
#'
#' @examples
#' rx_start_of_line(enable = TRUE)
#' rx_start_of_line(enable = FALSE)
#'
#' # create expression
#' x <- rx_start_of_line() %>%
#'   rx_find("apple")
#'
#' grepl(x, "pineapple") # should be false
#' grepl(x, "apple")     # should be true
#' @export
rx_start_of_line <- function(.data = NULL, enable = TRUE) {
  if (enable) {
    paste0(.data, "^")
  } else {
    .data
  }
}

#' Match the expression only if it appears till the end of the line.
#'
#' @description Control whether to match the expression only if it appears till
#' the end of the line. Basically, append a \code{$} to the end of the
#' expression. The dollar sign is considered an \emph{anchor} and matches the
#' position of characters. It can be used to "anchor" the regex match at a
#' certain position, in this case the dollar sign matches right after the last
#' character in the string.
#'
#' @param .data Expression to match, typically pulled from the pipe \code{\%>\%}
#' @param enable Whether to enable this behavior, defaults to \code{TRUE}
#'
#' @examples
#' rx_end_of_line(enable = TRUE)
#' rx_end_of_line(enable = FALSE)
#' rx_end_of_line("abc", enable = TRUE)
#'
#' # create expression
#' x <- rx_start_of_line(FALSE) %>%
#'   rx_find("apple") %>%
#'   rx_end_of_line()
#'
#' grepl(x, "apples") # should be false
#' grepl(x, "apple")  # should be true
#'
#' @references
#' Anchors: \url{https://www.regular-expressions.info/anchors.html}
#' @export
rx_end_of_line <- function(.data = NULL, enable = TRUE) {
  if (enable) {
    paste0(.data, "$")
  } else {
    .data
  }
}

#' Match an expression.
#'
#' @description Identify a specific pattern exactly.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param value Exact expression to match
#'
#' @examples
#' rx_find(value = "apple")
#'
#' # create expression
#' x <- rx_find(value = "apples")
#'
#' grepl(x, "apple")  # should be false
#' grepl(x, "apples") # should be true
#'
#' @references
#' Capturing group: \url{https://www.regular-expressions.info/brackets.html}
#'
#' Stack Overflow: \url{https://stackoverflow.com/questions/3512471}
#' @export
rx_find <- function(.data = NULL, value) {
  paste0(.data, "(", sanitize(value), ")")
}

#' Optionally match an expression.
#'
#' @description This expression uses a \emph{quantifier} \code{?} to optionally
#' match things. Specifically, the question mark makes the preceding token in
#' the regular expression optional.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param value Expression to optionally match
#'
#' @examples
#' rx_maybe(value = "abc")
#'
#' # create expression
#' x <- rx_start_of_line() %>%
#'   rx_maybe("abc") %>%
#'   rx_end_of_line(enable = FALSE)
#'
#' grepl(x, "xyz") # should be true
#'
#' @references
#' Quantifiers: \url{https://www.regular-expressions.info/optional.html}
#' @export
rx_maybe <- function(.data = NULL, value) {
  paste0(.data, "(", sanitize(value), ")?")
}

#' Alternatively, match either expression.
#'
#' @description Expression to match instead. If both expressions exists, both
#' will be returned. This just adds the vertical bar \code{|} often called an
#' \emph{alternator} which allows the user to find this \emph{or} that, or both!
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param ... A character vector
#'
#' @examples
#' x <- rx() %>%
#'   rx_either_of("cat", "dog") %>%
#'   rx_space() %>%
#'   rx_find("food")
#'
#' string <- c("dog food", "cat food", "fish food")
#'
#' grep(x, string, value = TRUE)
#' @export
rx_either_of <- function(.data, ...) {
  args <- paste(sapply(list(...), sanitize), collapse = "|")
  paste0(.data, "(", args, ")")
}

#' Match any character(s) any (including zero) number of times.
#'
#' @description This expression will match everything except line breaks using
#' the \emph{dot} and the \emph{star}. The Dot \code{.} is a
#' \emph{metacharacter} and the Star \code{*} is a \emph{quantifier}. When
#' combined the expression is considered greedy because it will match everything
#' (except line breaks) 0 or more times.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy}
#' matching stops after the first match, \code{greedy} continues searching until
#' end of the string and then back-tracks to the last match.
#'
#' @examples
#' rx_anything()
#' rx_anything(mode = "lazy")
#'
#' x <- rx_start_of_line() %>%
#'   rx_anything() %>%
#'   rx_end_of_line()
#'
#' grepl(x, "anything!")     # this should be true
#' grepl(rx_anything(), "")  # this should be true
#' grepl(rx_something(), "") # this should be false
#'
#' @references
#' Dot: \url{https://www.regular-expressions.info/dot.html}
#'
#' Star Quantifier: \url{https://www.regular-expressions.info/repeat.html}
#'
#' Greedy and Lazy Quantifiers: \url{https://www.regular-expressions.info/repeat.html#greedy}
#' @export
rx_anything <- function(.data = NULL, mode = "greedy") {
  switch(mode,
         greedy = paste0(.data, "(.*)"),
         lazy = paste0(.data, "(.*?)"),
         stop("Please, provide valid 'mode' argument")
  )
}

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
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
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
         greedy = paste0(.data, "([^", sanitize(value), "]*)"),
         lazy = paste0(.data, "([^", sanitize(value), "]*?)"),
         stop("Please, provide valid 'mode' argument")
  )
}

#' Match any character(s) at least once.
#'
#' @description This expression is almost identical to \code{rx_anything()}
#' with one major exception, a \code{+} is used instead of a \code{*}. This
#' means \code{rx_something()} expects \emph{something} whereas
#' \code{anything()} expects \emph{anything} including... nothing!
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
#'
#' @examples
#' rx_something()
#'
#' # construct an expression
#' x <- rx_something()
#'
#' grepl(x, "something!")   # this should be true
#' grepl(x, "")             # this should be false
#' grepl(rx_anything(), "") # this should be true
#'
#' @references
#' Metacharacters: \url{https://www.regular-expressions.info/characters.html#special}
#'
#' Greedy and Lazy Quantifiers: \url{https://www.regular-expressions.info/repeat.html#greedy}
#' @export
rx_something <- function(.data = NULL, mode = "greedy") {
  switch(mode,
         greedy = paste0(.data, "(.+)"),
         lazy = paste0(.data, "(.+?)"),
         stop("Please, provide valid 'mode' argument")
  )
}

#' Match any character(s) except these at least once.
#'
#' @description This expression is almost identical to \code{rx_anything_but()}
#' with one major exception, a \code{+} is used instead of a \code{*}. This
#' means \code{rx_something_but()} expects \emph{something} whereas
#' \code{rx_anything_but()} expects \emph{anything} including... nothing!
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param value Expression to optionally match
#' @param mode Matching mode (\code{greedy} (default) or\code{lazy}). \code{Lazy} matching stops after the first match, \code{greedy} continues
#' searching until end of the string and then back-tracks to the last match.
#'
#' @examples
#' rx_something_but(value = "abc")
#'
#' # create an expression
#' x <- rx_something_but(value = "python")
#'
#' grepl(x, "R")  # should be true
#' grepl(x, "py") # should be false
#'
#' @references
#' Metacharacters: \url{https://www.regular-expressions.info/characters.html#special}
#'
#' Greedy and Lazy Quantifiers: \url{https://www.regular-expressions.info/repeat.html#greedy}
#' @export
rx_something_but <- function(.data = NULL, value, mode="greedy") {
  switch(mode,
         greedy = paste0(.data, "([^", sanitize(value), "]+)"),
         lazy = paste0(.data, "([^", sanitize(value), "]+?)"),
         stop("Please, provide valid 'mode' argument")
  )
}

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

#' Ensure that the parameter does not follow.
#'
#' @description This expression uses a \emph{negative lookahead} to ensure the
#' value given does not follow the previous verbal expression,
#' \code{perl = TRUE} is required. For example, if you were to look for the
#' letter \emph{q} but not the letter \emph{u} you might translate this to,
#' "find the letter q everytime the letter u does \emph{not} come after it".
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param value Value to ensure absence of
#'
#' @examples
#' rx_not(value = "FEB-28")
#'
#' # construct expression
#' x <- rx_start_of_line() %>%
#'   rx_find('FEB-29') %>%
#'   rx_not("FEB-28")
#'
#' # create a string
#' string <- c("FEB-29-2017", "FEB-28-2017")
#'
#' # extract matches, perl = TRUE is required for negative lookahead
#' regmatches(string, regexpr(x, string, perl = TRUE))
#'
#' # another example
#' rx_find(value = "q") %>%
#'   rx_not("u") %>%
#'   grepl(x = c("qu", "qa", "qq", "q", "q u"), perl = TRUE)
#'
#' @references
#' Negative lookahead: \url{https://www.regular-expressions.info/lookaround.html}
#'
#' @export
rx_not <- function(.data = NULL, value) {
  paste0(.data, "(?!", sanitize(value), ")")
}

#' Match any character within the range defined by the parameters.
#'
#' @description Value parameter will be interpreted as pairs. For example,
#' \code{range(c('a', 'z', '0', '9'))} will be interpreted to mean any
#' character within the ranges a–z (ascii x–y) or 0–9 (ascii x–y). The method
#' expects an even number of parameters; unpaired parameters are ignored.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param value Range of characters. The method expects an even number of
#' parameters; unpaired parameters are ignored.
#'
#' @examples
#' rx_range(value = c('1', '3'))
#'
#' # create an expression
#' x <- rx_range(value = c('1', '3'))
#'
#' grepl(x, "2") # should be true
#' grepl(x, "4") # should be false
#' @export
rx_range <- function(.data = NULL, value) {
  value <- split(value, ceiling(seq_along(value)/2))
  value <- value[lengths(value) == 2]
  value <- lapply(value, function(i) paste0(i[1], "-", i[2]))
  paste0(.data, "[", paste0(unlist(value, use.names = FALSE), collapse = ""), "]")
}

#' Find beginning or end of a word.
#'
#' @description Match beginning or end of a word—a string consisting of of word
#' characters (a–z, A–Z, 0–9 or _).
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#'
#' @examples
#' rx_word_edge()
#'
#'x <- rx_word_edge() %>%
#'  rx_alpha() %>%
#'  rx_one_or_more() %>%
#'  rx_word_edge()
#'
#'# create inputs
#'string1 <- "foobar"
#'string2 <- "foo 23a bar"
#'
#'# matches 'foobar'
#'regmatches(string1, regexpr(x, string1))
#'# matches 'foo' and 'bar' separately
#'regmatches(string2, gregexpr(x, string2))
#' @export
rx_word_edge <- function(.data = NULL){
  paste0(.data, "\\b")
}
