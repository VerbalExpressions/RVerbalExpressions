context("test-rx_seek")

test_that("positive lookarounds work", {
  txt <- "can you [get me) please but not (this)"
  x <- rx() %>%
    rx_seek_prefix("[") %>%
    rx_anything(mode = "lazy") %>%
    rx_seek_suffix(")")
  mtch <- unlist(regmatches(txt, gregexpr(x, txt, perl = TRUE)))

  # expect match
  expect_true(grepl(rx() %>% rx_seek_prefix("["), txt, perl = TRUE))
  expect_true(grepl(rx() %>% rx_seek_suffix(")"), txt, perl = TRUE))

 # expect match
  expect_equal(nchar(mtch), 6)

  # poslitive lookahead works
  y <- rx_start_of_line() %>%
    rx_digit() %>%
    rx_multiple(min = 3, max = 3) %>%
    rx_seek_suffix(" dollars")
  tyt <- "100 dollars"
  expect_equal(unlist(regmatches(tyt, gregexpr(y, tyt, perl = TRUE))), "100")

  # positive lookbehind works
  z <- rx() %>%
    rx_seek_prefix("USD") %>%
    rx_digit() %>%
    rx_multiple(min = 3, max = 3)
  tzt <- "USD100"
  expect_equal(unlist(regmatches(tzt, gregexpr(z, tzt, perl = TRUE))), "100")

})
