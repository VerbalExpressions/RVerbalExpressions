context("test-maybe")

test_that("maybe rule works", {

  # expect minimal output
  expect_equal(maybe(value = ""), "(?:)?")

  # expect 0 or more match
  expect_true(grepl(maybe(value = "xyz"), "abc"))

  # expect match
  expect_true(start_of_line() %>% then("http") %>%  maybe("s") %>% grepl(x = "http"))

  # expect error when value param is not assigned
  expect_error(maybe())
  expect_error(maybe("abc"))
})

