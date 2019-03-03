context("test-not")

test_that("not rule works", {

  # expect minimal output
  expect_equal(not(value = ""), "(?!)")

  # expect that u is not followed by q
  expect_false(grepl(find(value = "q") %>% not("u"), "qu", perl = TRUE))
  expect_true(grepl(find(value = "q") %>% not("u"), "qa", perl = TRUE))

})
