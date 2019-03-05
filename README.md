
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RVerbalExpressions

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/VerbalExpressions/RVerbalExpressions.svg?branch=master)](https://travis-ci.org/VerbalExpressions/RVerbalExpressions)
[![AppVeyor Build
status](https://ci.appveyor.com/api/projects/status/phr93q0rp7edf376?svg=true)](https://ci.appveyor.com/project/tyluRp/rverbalexpressions-4tt0n)
[![Codecov test
coverage](https://codecov.io/gh/VerbalExpressions/RVerbalExpressions/branch/master/graph/badge.svg)](https://codecov.io/gh/VerbalExpressions/RVerbalExpressions?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Netlify
Status](https://api.netlify.com/api/v1/badges/e49a67b8-17c9-40ba-9e53-3f9d83590e87/deploy-status)](https://app.netlify.com/sites/rverbalexpressions/deploys)
<!-- badges: end -->

The goal of `RVerbalExpressions` is to make it easier to construct
regular expressions using grammar and functionality inspired by
[VerbalExpressions](https://github.com/VerbalExpressions). Usage of
`%>%` is encouraged to build expressions in a chain like fashion.

There are a couple of functions missing from the original
[JSVerbalExpressions](https://github.com/VerbalExpressions/JSVerbalExpressions):

1.  `replace` isn’t included because there are numerous R functions for
    this, `gsub` being one example
2.  `add` is a utility function for appending expressions to one another
    and isn’t included because we use `%>%` for that

Others just haven’t made it yet, see [here](.github/CONTRIBUTING.md).

## Installation

You can install `RVerbalExpressions` from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("VerbalExpressions/RVerbalExpressions")
```

## Example

This is a basic example which shows you how to build a regular
expression:

``` r
library(RVerbalExpressions)

# construct an expression
x <- start_of_line() %>% 
  find('http') %>% 
  maybe('s') %>% 
  find('://') %>% 
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

Additionally, there are two R packages that try to solve the same
problem. I encourage you to check these out:

1.  [rex](https://github.com/kevinushey/rex) by
    [@kevinushey](https://twitter.com/kevin_ushey)
2.  [rebus](https://github.com/richierocks/rebus) by
    [@richierocks](https://twitter.com/richierocks?lang=en)

## Contributing

If you find any issues, please file an issue or submit a PR. All
contributions are welcome\! See the list of todo items
[here](.github/CONTRIBUTING.md) if you’re looking for something to
specific to work on.
