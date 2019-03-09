context("test-rx_lower")

test_that("lower works", {

  # expect match
  expect_true(grepl(rx_lower(), "a"))

  # dont expect match
  expect_false(grepl(rx_lower(), "A"))
  expect_false(grepl(rx_lower(), "!"))

  # expect pipe functionality
  expect_equal(rx() %>% rx_start_of_line() %>% rx_lower(), "^[[:lower:]]")

})
