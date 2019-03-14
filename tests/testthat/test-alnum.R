context("test-rx_alnum")

test_that("alnum works", {

  # expect match
  expect_true(grepl(rx_alphanum(), "abc123"))

  # dont expect match
  expect_false(grepl(rx_alphanum(), "!"))

  # expect pipe functionality to work

  expect_equal(rx() %>% rx_start_of_line() %>% rx_alnum(), "^[A-z0-9]")

  # expect inverse
  expect_true(grepl(rx_alnum(inverse = TRUE), "!"))

  # expect error if incorrect inverse value
  expect_error(grepl(rx_alnum(inverse = 1), "!"))

  expect_equal(rx() %>% rx_start_of_line() %>% rx_alphanum() %>% as.character(), "^[[:alnum:]]")


})
