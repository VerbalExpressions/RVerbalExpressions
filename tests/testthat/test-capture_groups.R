context("test-capture_groups")

test_that("capture groups work", {

  # expect correct output
  expect_equal(rx_begin_capture(), new_rx("("))
  expect_equal(rx_end_capture(), new_rx(")"))
  expect_equal(rx_begin_capture() %>% rx_end_capture(), new_rx("()"))
  expect_equal("" %>% rx_begin_capture(), new_rx("("))

})
