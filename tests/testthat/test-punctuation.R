context("test-rx_punctuation")

test_that("punctuation special character works", {

  # expect minimal output
  expect_equal(rx_punctuation() %>% as.character(), "[[:punct:]]")
  expect_equal(rx_punctuation(inverse = TRUE) %>% as.character(), "[^[:punct:]]")

  # expect match
  expect_true(grepl(rx_punctuation(), "!"))

  # expect match only spaces
  expect_equal(
    regmatches("abc!", gregexpr(rx_punctuation(), "abc!"))[[1]], "!"
  )

  # dont expect match
  expect_false(grepl(rx_punctuation(), "abc"))

  # expect inverse behavior
  expect_false(grepl(rx_punctuation(inverse = TRUE), "!"))
  expect_true(grepl(rx_punctuation(inverse = TRUE), " "))
  expect_true(grepl(rx_punctuation(inverse = TRUE), "\t"))
  expect_true(grepl(rx_punctuation(inverse = TRUE), "\n"))
  expect_true(grepl(rx_punctuation(inverse = TRUE), "\r"))

  # expect error if incorrect value to inverse arg
  expect_error(rx_punctuation(inverse = 1))

})
