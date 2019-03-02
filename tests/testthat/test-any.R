context("test-any")

# comments so github doesn't think this is Rebol
test_that("any rule works", {
  expect_equal(any(value = ""), "[]")
  expect_true(grepl(any(value = "abc"), "b"))
  expect_false(grepl(any(value = "abc"), "d"))
  expect_equal(any(.data = "^", value = "abc"), "^[abc]")
  expect_true(length(unlist(regmatches("abba", gregexpr(any(value = "a"), "abba")))) == 2)
})
