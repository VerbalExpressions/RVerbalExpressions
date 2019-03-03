context("test-find")

test_that("find_rule works", {

  # expect the correct minimal output
  expect_equal(find(value = ""), "(?:)")

  # expect a match
  expect_true(grepl(find(value = "ABC"), "ABC"))

  # dont expect a match, case sensitive
  expect_false(grepl(find(value = "ABC"), "abc"))

  expect_false(grepl(find(value = "abc"), "ac"))

  expect_true(start_of_line() %>% find("abc") %>% grepl(x = "abc"))
  expect_false(start_of_line() %>% find("abc") %>% grepl(x = "dabc"))

})
