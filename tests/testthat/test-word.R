context("test-word-functions")

test_that("word functions work", {

  # expect minimal output
  expect_equal(rx_word() %>% as.character(), "\\w+")
  expect_equal(rx_word_char() %>% as.character(), "\\w")
  expect_equal(rx_word_edge() %>% as.character(), "\\b")

})
