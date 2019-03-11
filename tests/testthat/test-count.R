context("test-rx_count")

test_that("count works", {
  x <- rx_find(value = "a") %>%  rx_count(n = 3)

  # expect n vector working properly
  expect_equal(rx_count(n = c(1, 2)), "{1,2}")

  # expect match
  expect_equal(rx_count(), "{1}")
  expect_equal(rx_count(n = 3), "{3}")

  # expect match
  expect_true(grepl(x, "aaa"))
  expect_false(grepl(x, "aaba"))

})
