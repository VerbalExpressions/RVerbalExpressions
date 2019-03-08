context("test-rx_something_but")

test_that("something_but rule works", {

  # expect match
  expect_true(grepl(rx_something_but(value = "a"), "b"))

  # dont expect match
  expect_false(grepl(rx_something_but(value = "a"), "a"))

  # expect to match something but "a"
  expect_equal(
    regmatches("abc", gregexpr(rx_something_but(value = "a"), "abc"))[[1]], "bc"
  )

})
