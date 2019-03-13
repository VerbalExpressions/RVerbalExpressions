context("test-word-functions")

test_that("word functions work", {

  # expect minimal output
  expect_equal(rx_word(), "\\w+")
  expect_equal(rx_word_char(), "\\w")
  expect_equal(rx_word_edge(), "\\b")

})
