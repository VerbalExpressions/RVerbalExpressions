context("test-rx_lowercase")

test_that("lowercase works", {

  # expect match
  expect_true(grepl(rx_lowercase(), "a"))

  # dont expect match
  expect_false(grepl(rx_lowercase(), "A"))
  expect_false(grepl(rx_lowercase(), "!"))

  # expect pipe functionality
  expect_equal(rx() %>% rx_start_of_line() %>% rx_lowercase(), "^[[:lower:]]")

})
