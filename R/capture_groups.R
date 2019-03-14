#' Begin a capture group.
#'
#' @details Capture groups are used to extract data from within the regular
#' expression match for further processing.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @export
rx_begin_capture <- function(.data = NULL) {
    res <- paste0("(", .data)
    new_rx(res)
}

#' End a capture group.
#'
#' @details Capture groups are used to extract data from within the regular
#' expression match for further processing.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @export
rx_end_capture <- function(.data = NULL) {
    res <- paste0(.data, ")")
    new_rx(res)
}

