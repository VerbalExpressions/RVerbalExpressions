context("test-rx_start_of_line")

test_that("start_of_line works", {

  # expect correct output
  expect_equal(rx_start_of_line(), new_rx("^"))

})
