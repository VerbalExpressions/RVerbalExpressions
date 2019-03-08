context("test-rx_any_of")

test_that("any_of rule works", {
  # expect bare output
  expect_equal(rx_any_of(value = ""), "[]")

  # expect match
  expect_true(grepl(rx_any_of(value = "abc"), "b"))

  # expect no match
  expect_false(grepl(rx_any_of(value = "abc"), "d"))

  # expect pipe functionality
  expect_equal(rx_any_of(.data = "^", value = "abc"), "^[abc]")

  # expect correct number of matches
  expect_true(length(unlist(regmatches("abba", gregexpr(rx_any_of(value = "a"), "abba")))) == 2)
})
