context("test-capture_groups")

test_that("capture groups work", {

  # expect correct output
  expect_equal(rx_begin_capture() %>% as.character(), "(")
  expect_equal(rx_end_capture() %>% as.character(), ")")
  expect_equal(rx_begin_capture() %>% rx_end_capture() %>% as.character(), "()")
  expect_equal("" %>% rx_begin_capture() %>% as.character(), "(")

})
