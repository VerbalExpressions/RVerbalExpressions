context("test-rx_find")

test_that("find_rule works", {

  # expect the correct minimal output
  expect_equal(rx_find(value = ""), "()")

  # expect a match
  expect_true(grepl(rx_find(value = "ABC"), "ABC"))

  # dont expect a match, case sensitive
  expect_false(grepl(rx_find(value = "ABC"), "abc"))

  expect_false(grepl(rx_find(value = "abc"), "ac"))

  expect_true(rx_start_of_line() %>% rx_find("abc") %>% grepl(x = "abc"))
  expect_false(rx_start_of_line() %>% rx_find("abc") %>% grepl(x = "dabc"))

})
