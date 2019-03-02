context("test-any_of")

test_that("any_of rule works", {
  # expect bare output
  expect_equal(any_of(value = ""), "[]")

  # expect match
  expect_true(grepl(any_of(value = "abc"), "b"))

  # expect no match
  expect_false(grepl(any_of(value = "abc"), "d"))

  # expect pipe functionality
  expect_equal(any(.data = "^", value = "abc"), "^[abc]")

  # expect correct number of matches
  expect_true(length(unlist(regmatches("abba", gregexpr(any_of(value = "a"), "abba")))) == 2)
})
