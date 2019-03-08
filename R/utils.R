# vex <- function(x, ...) structure(x, class = "vex")
#
# p <- function(...) {
#   vex(paste(sep = "", collapse = "", ...))
# }
#
# pretty_chars <- function(x, ...) {
#   chars <- c(".", "|", "*", "?", "+", "(", ")", "{", "}", "^", "$", "\\", ":", "=", "[", "]")
#   x_split <- strsplit(x, split = NULL)[[1]]
#   escape_idx <- which(x_split %in% chars)
#   x_split[escape_idx] <- crayon::bold(x_split[escape_idx])
#   cat(x_split, sep = "")
# }
#
# start_of_line() %>%
#   find("abc") %>%
#   end_of_line() %>%
#   pretty_chars()

# library(RVerbalExpressions)
#
# if_next_is <- function(.data, value) {
#   paste0("(?:", .data, "(?=", sanitize(value), ")", ")")
# }
#
# if_prev_is <- function(.data, value) {
#   paste0("(?:", "(?<=", .data, ")", sanitize(value), ")")
# }
#
# if_next_isnt <- function(.data, value) {
#   paste0("(?:", .data, "(?!", sanitize(value), ")", ")")
# }
#
# if_prev_isnt <- function(.data, value) {
#   paste0(.data, "(?:", "(?<!", sanitize(x), ")", .data, ")")
# }
#
# w <- find(value = "bar") %>%
#   if_next_is("bar") %>%
#   anything()
#
# x <- find(value = "bar") %>%
#   if_prev_is("bar") %>%
#   anything()
#
# y <- find(value = "bar") %>%
#   if_next_isnt("bar") %>%
#   anything()
#
# z <- find(value = "bar") %>%
#   if_prev_isnt("bar") %>%
#   anything()
#
# stringr::str_extract("foobarbarfoo", w)
# stringr::str_extract("foobarbarfoo", x)
# stringr::str_extract("foobarbarfoo", y)
# stringr::str_extract("foobarbarfoo", z)

# step_ahead <- function(.data, value) {
#   paste0("(?<=", .data)
# }
#
# step_back <- function(.data) {
#   paste0("(?=", .data)
# }
#
# step_ahead <- function(.data = NULL){
#   val <- regmatches(.data, regexpr("(?<=\\(\\?\\:).*(?=\\)\\??$)", .data, perl = TRUE))
#   if (!length(val)) return(.data)
#   post <- regmatches(.data, regexpr("(?<=\\(\\?\\:).*$", .data, perl = TRUE))
#   pre <- regmatches(.data, regexpr("^.*(?=\\(\\?\\:.*$)", .data, perl = TRUE))
#   paste0(pre, "(?<=", post)
# }
#
# step_back <- function(.data = NULL){
#   val <- regmatches(.data, regexpr("(?<=\\(\\?\\:)[^\\(\\?\\:]*(?=\\)\\??$)", .data, perl = TRUE))
#   if (!length(val)) return(.data)
#   post <- regmatches(.data, regexpr("(?<=\\(\\?\\:)[^\\(\\?\\:]*$", .data, perl = TRUE))
#   pre <- regmatches(.data, regexpr("^.*(?=\\(\\?\\:[^\\(\\?\\:]*$)", .data, perl = TRUE))
#   paste0(pre, "(?=", post)
# }

# find(value = "(") %>%
#   step_ahead() %>%
#   begin_capture() %>%
#   anything() %>%
#   find(")") %>%
#   step_back() %>%
#   end_capture()

# # seems to work
# x <- find(value = "(", step = 'forward') %>%
#   anything_but(")") %>%
#   find(")", step = 'backward')
#
# # grabs foo
# y <- find(value = "(", step = 'forward') %>%
#   anything() %>%
#   find(")", step = 'backward')
#
# z <- find(value = "(", step = "forward") %>%
#   anything(greedy = FALSE) %>%
#   find(")", step = "backward")
#
# stringr::str_extract_all("(extract) foo (me)", x)
# stringr::str_extract_all("(extract) foo (me)", y)
# stringr::str_extract_all("(extract) foo (me)", z)
#
# x <- find(value = "(", step='forward') %>%     # or find("(", step=1)
#   begin_capture() %>%
#   anything() %>%
#   find(")", step='backward') %>%     # or find(")", step=-1)
#   end_capture()
#
# library(dplyr)
#
# sanitize <- function(.data) {
#   escape_chrs <- c(".", "|", "*", "?", "+", "(", ")", "{", "}", "^", "$", "\\", ":", "=", "[", "]")
#   string_chrs <- strsplit(.data, "")[[1]]
#   idx <- which(string_chrs %in% escape_chrs)
#   idx_new <- paste0("\\", string_chrs[idx])
#   paste0(replace(string_chrs, idx, idx_new), collapse = "")
# }
#
# anything <- function(.data = NULL, greedy = TRUE) {
#   if(isTRUE(greedy)) {
#     paste0(.data, "(?:.*)")
#   } else if(isFALSE(greedy)){
#     paste0(.data, "(?:.*?)")
#   }
# }
#
# find <- function(.data = NULL, value, step = NULL) {
#   if(is.null(step)) {
#     paste0(.data, "(?:", sanitize(value), ")")
#   } else if(step == "forward") {
#     paste0(.data, "(?<=", sanitize(value), ")")
#   } else if(step == "backward") {
#     paste0(.data, "(?=", sanitize(value), ")")
#   }
# }
#
# z <- find(value = "(", step = "forward") %>%
#   anything(greedy = FALSE) %>%
#   find(")", step = "backward")
#
# z
#
# stringr::str_extract_all("(extract) foo (me) ()", z)
