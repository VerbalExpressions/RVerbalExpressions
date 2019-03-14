context("test-rx_uppercase")

test_that("uppercase works", {

  # expect match
  expect_true(grepl(rx_uppercase(), new_rx("A")))

  # dont expect match
  expect_false(grepl(rx_uppercase(), "a"))
  expect_false(grepl(rx_uppercase(), "!"))

  # expect pipe functionality
  expect_equal(rx() %>% rx_start_of_line() %>% rx_uppercase(), new_rx("^[[:upper:]]"))

})
