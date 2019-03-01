#' Escape characters expected special by regex engines
#'
#' @details Take an input and escape all characters considered special by
#' the regex engine.
#' This is used internally when you add a string to the \code{value}
#' parameter in most of the available functions. It is exported and useable
#' externally for users that want to escape all special characters in their
#' desired match. The following special characters are escaped: . | *
#' ? + ( ) { } ^ $ \\ : = [ ]
#'
#' @param .data String to sanitize
#' @examples
#' sanitize("^")
#' sanitize("^+")
#' sanitize("^+?")
#' @export
sanitize <- function(.data) {
  escape_chrs <- c(".", "|", "*", "?", "+", "(", ")", "{", "}", "^", "$", "\\", ":", "=", "[", "]")
  string_chrs <- strsplit(.data, "")[[1]]
  idx <- which(string_chrs %in% escape_chrs)
  idx_new <- paste0("\\", string_chrs[idx])
  paste0(replace(string_chrs, idx, idx_new), collapse = "")
}
