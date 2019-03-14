context("test-rx_count")

test_that("count works", {
  x <- rx() %>% rx_find("a") %>%  rx_count(n = 3)

  # expect n vector working properly
  expect_equal(rx_count(n = c(1, 2)), new_rx("{1,2}"))

  # expect match
  expect_equal(rx_count(), rx())
  expect_equal(rx_count(n = 3), new_rx("{3}"))

  # expect match
  expect_true(grepl(x, new_rx("aaa")))
  expect_false(grepl(x, new_rx("aaba")))

})
