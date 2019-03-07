context("test-whitespace")

test_that("whitespace special character works", {

  # expect minimal output
  expect_equal(whitespace(), "\\s")

  # expect match
  expect_true(grepl(whitespace(), " "))

  # expect match only spaces
  expect_equal(
    regmatches("a b c", gregexpr(whitespace(), "a b c"))[[1]], c(" ", " ")
  )

  # dont expect match
  expect_false(grepl(whitespace(), "abc"))

})
