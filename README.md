
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RVerbalExpressions

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of `RVerbalExpressions` is to make it easier to construct
regular expressions. Grammar and functionality inspired by
[VerbalExpressions](https://github.com/VerbalExpressions), this is
essentially another port using the R programming language. Usage of
`%>%` is encouraged to build expressions in a chain like fashion.

There are a couple of functions missing from the original
[JSVerbalExpressions](https://github.com/VerbalExpressions/JSVerbalExpressions):

1.  `replace` isn’t included because there are numerous R functions for
    this, `gsub` being one example
2.  `add` is a utility function for appending expressions to one another
    and isn’t included because we use `%>%` for that

## Installation

You can install `RVerbalExpressions` from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("tyluRp/RVerbalExpressions")
```

## Example

This is a basic example which shows you how to build a regular
expression:

``` r
library(RVerbalExpressions)

# construct an expression
x <- start_of_line() %>% 
  then('http') %>% 
  maybe('s') %>% 
  then('://') %>% 
  maybe('www.') %>% 
  anything_but(' ') %>% 
  end_of_line()

x
#> [1] "^(?:http)(?:s)?(?:\\://)(?:www\\.)?(?:[^ ]*)$"

grepl(x, "https://www.google.com")
#> [1] TRUE
```

## Other Implementations

You can see an up to date list of all ports on
[VerbalExpressions.github.io](https://VerbalExpressions.github.io).

  - [JavaScript](https://github.com/VerbalExpressions/JSVerbalExpressions)
  - [Ruby](https://github.com/ryan-endacott/verbal_expressions)
  - [C\#](https://github.com/VerbalExpressions/CSharpVerbalExpressions)
  - [Python](https://github.com/VerbalExpressions/PythonVerbalExpressions)
  - [Java](https://github.com/VerbalExpressions/JavaVerbalExpressions)
  - [Groovy](https://github.com/VerbalExpressions/GroovyVerbalExpressions)
  - [PHP](https://github.com/VerbalExpressions/PHPVerbalExpressions)
  - [Haskell](https://github.com/VerbalExpressions/HaskellVerbalExpressions)
  - [Haxe](https://github.com/VerbalExpressions/HaxeVerbalExpressions)
  - [C++](https://github.com/VerbalExpressions/CppVerbalExpressions)
  - [Objective-C](https://github.com/VerbalExpressions/ObjectiveCVerbalExpressions)
  - [Perl](https://github.com/VerbalExpressions/PerlVerbalExpressions)
  - [Swift](https://github.com/VerbalExpressions/SwiftVerbalExpressions)

## Contributing

If you find any issues, please file an issue or submit a PR. All
contributions are welcome\!
