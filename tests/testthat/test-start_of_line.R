context("test-rx_start_of_line")

test_that("start_of_line works", {

  # expect correct output
  expect_equal(rx_start_of_line() %>% as.character(), "^")

  # expect null if start_of_line isn't enabled
  expect_null(rx_start_of_line(enable = FALSE))

})
