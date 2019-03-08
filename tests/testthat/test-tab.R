context("test-rx_tab")

test_that("tab special character works", {
  # expect minimal output
  expect_equal(rx_tab(), "\\t")

  # expect match
  expect_true(grepl(rx_tab(), "\t"))

  # expect match
  expect_true(grepl(rx_tab(), "hello\tworld"))

})
