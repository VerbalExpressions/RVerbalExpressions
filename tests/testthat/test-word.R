context("test-word-functions")

test_that("word functions work", {

  # expect minimal output
  expect_equal(rx_word(), new_rx("\\w+"))
  expect_equal(rx_word_char(), new_rx("\\w"))
  expect_equal(rx_word_edge(), new_rx("\\b"))

})
