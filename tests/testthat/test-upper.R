context("test-rx_upper")

test_that("upper works", {

  # expect match
  expect_true(grepl(rx_upper(), "A"))

  # dont expect match
  expect_false(grepl(rx_upper(), "a"))
  expect_false(grepl(rx_upper(), "!"))

  # expect pipe functionality
  expect_equal(rx() %>% rx_start_of_line() %>% rx_upper(), "^[[:upper:]]")

})
