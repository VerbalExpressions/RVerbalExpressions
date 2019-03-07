context("test-with_any_case")

test_that("with_any_case modifier works", {

  # expect match
  expect_true(grepl(find(value = "ABC") %>% with_any_case(), "abc"))

  # dont expect match
  expect_false(grepl(find(value = "ABC") %>% with_any_case(enable = FALSE), "abc"))

})
