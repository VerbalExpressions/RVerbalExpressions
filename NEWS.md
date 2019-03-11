# RVerbalExpressions 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
* Deprecated `then()` and `any()` in favor of `any_of()` and `find()`. 
* `rx_` prefix added per [Dmytro Perepolkin's](https://github.com/dmi3kno)  suggestion [(#1)](https://github.com/VerbalExpressions/RVerbalExpressions/issues/1)
* Add `rx()` constructor (#4)
* Added lazy mode for `rx_anything()`, `rx_anything_but()`, `rx_something()`, `rx_something_but()`.
* Added `rx_lowercase()`, `rx_uppercase()`, `rx_alnum()`, `rx_alpha()`.
* Added `rx_word_char()`, `rx_word_edge()`, extended `rx_count()` to ranges of repetition 
* Added `rx_space()`
* Added `inverse` argument to invert matching behavior, this applies to `rx_digit()`, `rx_digits()`, `rx_alnum()`, `rx_space()`, `rx_punctuation()`, `rx_whitespace()`, `rx_space()`

