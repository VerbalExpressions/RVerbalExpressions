context("test-any")

test_that("any rule works", {
  # expect bare output
  expect_equal(any(value = ""), "[]")

  # expect match
  expect_true(grepl(any(value = "abc"), "b"))

  # expect no match
  expect_false(grepl(any(value = "abc"), "d"))

  # expect pipe functionality
  expect_equal(any(.data = "^", value = "abc"), "^[abc]")

  # expect correct number of matches
  expect_true(length(unlist(regmatches("abba", gregexpr(any(value = "a"), "abba")))) == 2)
})
