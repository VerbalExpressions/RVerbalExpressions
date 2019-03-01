context("test-any_of")

test_that("any_of rule works", {
  expect_equal(any_of(value = ""), "[]")
  expect_true(grepl(any_of(value = "abc"), "b"))
  expect_false(grepl(any_of(value = "abc"), "d"))
  expect_equal(any(.data = "^", value = "abc"), "^[abc]")
  expect_true(length(unlist(regmatches("abba", gregexpr(any_of(value = "a"), "abba")))) == 2)
})
