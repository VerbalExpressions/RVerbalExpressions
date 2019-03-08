context("test-rx_whitespace")

test_that("whitespace special character works", {

  # expect minimal output
  expect_equal(rx_whitespace(), "\\s")

  # expect match
  expect_true(grepl(rx_whitespace(), " "))

  # expect match only spaces
  expect_equal(
    regmatches("a b c", gregexpr(rx_whitespace(), "a b c"))[[1]], c(" ", " ")
  )

  # dont expect match
  expect_false(grepl(rx_whitespace(), "abc"))

})
