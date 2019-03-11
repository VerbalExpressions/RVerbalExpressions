# for testing purposes, see #12
rx_test <- function(x, txt){
  regmatches(txt, gregexpr(x, txt, perl = TRUE))
}
