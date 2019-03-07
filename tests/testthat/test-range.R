context("test-range")

test_that("range rule works", {

  # expect minimal output
  expect_equal(range(value = ""), "[]")

  # expect equal length even if unequal length given
  expect_length(
    regmatches(
      range(value = c(1, 2, 3)),
      gregexpr(digit(), range(value = c(1, 2, 3))))[[1]], 2
    )

  # expect that unequal range entry (3) is ignored
  expect_equal(
    regmatches(
      range(value = c(1, 2, 3)),
      gregexpr(digit(), range(value = c(1, 2, 3))))[[1]], c("1", "2")
  )


})
