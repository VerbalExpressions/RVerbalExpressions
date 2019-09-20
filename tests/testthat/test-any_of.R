context("test-rx_any_of")

test_that("any_of rule works", {
  # expect bare output
  expect_equal(rx() %>% rx_any_of(value = "") %>% as.character(), "[]")

  # expect match
  expect_true(grepl(rx() %>% rx_any_of(value = "abc"), "b"))

  # expect no match
  expect_false(grepl(rx() %>% rx_any_of(value = "abc"), "d"))

  # expect pipe functionality
  expect_equal(rx_any_of(.data = "^", value = "abc") %>% as.character(), "^[abc]")

  # expect correct number of matches
  expect_true(length(unlist(regmatches("abba", gregexpr(rx() %>% rx_any_of(value = "a"), "abba")))) == 2)

})
