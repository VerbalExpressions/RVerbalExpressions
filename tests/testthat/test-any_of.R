context("test-rx_any_of")

test_that("any_of rule works", {
  # expect bare output
  expect_equal(rx() %>% rx_one_of(""), new_rx("[]"))

  # expect match
  expect_true(grepl(rx() %>% rx_one_of("abc"), "b"))

  # expect no match
  expect_false(grepl(rx() %>% rx_one_of("abc"), "d"))

  # expect pipe functionality
  expect_equal(rx_start_of_line() %>% rx_one_of("abc"), new_rx("^[abc]"))

  # expect correct number of matches
  expect_true(length(unlist(regmatches("abba", gregexpr(rx() %>% rx_one_of("a"), "abba")))) == 2)
})
