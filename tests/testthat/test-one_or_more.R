context("test-rx_one_or_more")

test_that("quanitfiers work", {
  x <- rx_find(value = "a") %>% rx_one_or_more()
  xl <- rx_find(value = "a") %>% rx_one_or_more(mode = "lazy")
  y <- rx_find(value = "a") %>% rx_none_or_more()
  yl <- rx_find(value = "a") %>% rx_none_or_more(mode = "lazy")

  # expect match
  expect_false(grepl(x, "UK"))
  expect_true(grepl(y, "UK"))

  # expect match
  expect_false(grepl(xl, "UK"))
  expect_true(grepl(yl, "UK"))

  # expect match
  expect_equal(rx_one_or_more(), "+")
  expect_equal(rx_none_or_more(), "*")

  expect_error(rx_one_or_more(mode = "whatever"))
  expect_error(rx_none_or_more(mode = "whatever"))

})
