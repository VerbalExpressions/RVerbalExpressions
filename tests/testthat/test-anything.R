context("test-rx_anything")

test_that("anything rule works", {
  # expect bare output
  expect_equal(rx_anything() %>% as.character(), "(.*)")
  expect_equal(rx_anything(mode = "lazy") %>% as.character(), "(.*?)")

  # expect match
  expect_true(grepl(rx_anything(), "b"))
  expect_true(grepl(rx_anything(mode = "lazy"), "b"))

  # expect match
  expect_true(grepl(rx_anything(), "a!.>\\"))
  expect_true(grepl(rx_anything(mode = "lazy"), "a!.>\\"))

  # expect pipe functionality
  expect_equal(rx_anything(.data = "^") %>% as.character(), "^(.*)")
  expect_equal(rx_anything(.data = "^", mode = "lazy") %>% as.character(), "^(.*?)")

  # expect an error if invalid 'mode' is given
  expect_error(rx_anything(mode = "whatever"))

  # expect correct number of matches
  expect_true(nchar(unlist(regmatches("abc", gregexpr(rx_anything(), "abc")))) == 3)
  expect_true(compare(nchar(unlist(regmatches("abc", gregexpr(rx_anything(mode="lazy"), "abc")))), c(0,0,0))$equal)
})
