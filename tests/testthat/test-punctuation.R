context("test-rx_punctuation")

test_that("punctuation special character works", {

  # expect minimal output
  expect_equal(rx_punctuation(), new_rx("[[:punct:]]"))
  expect_equal(rx_punctuation(negate = TRUE), new_rx("[^[:punct:]]"))

  # expect match
  expect_true(grepl(rx_punctuation(), "!"))

  # expect match only spaces
  expect_equal(
    regmatches("abc!", gregexpr(rx_punctuation(), "abc!"))[[1]], "!"
  )

  # dont expect match
  expect_false(grepl(rx_punctuation(), "abc"))

  # expect inverse behavior
  expect_false(grepl(rx_punctuation(negate = TRUE), "!"))
  expect_true(grepl(rx_punctuation(negate = TRUE), " "))
  expect_true(grepl(rx_punctuation(negate = TRUE), "\t"))
  expect_true(grepl(rx_punctuation(negate = TRUE), "\n"))
  expect_true(grepl(rx_punctuation(negate = TRUE), "\r"))

  # expect error if incorrect value to inverse arg
  expect_error(rx_punctuation(inverse = 1))

})
