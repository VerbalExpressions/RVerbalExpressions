context("test-either_of")

test_that("rx_either_of works", {

  x <- rx() %>%
    rx_either_of("cat", "dog") %>%
    rx_space() %>%
    rx_find("food")

  string <- c("dog food", "cat food", "fish food")

  # expect only two matches in above example
  expect_equal(table(grepl(x, string))[["TRUE"]], 2)

})
