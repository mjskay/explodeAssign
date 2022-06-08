
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Explode-assignment operators

<!-- badges: start -->
<!-- badges: end -->

This package provides two alternative assignment operators for R:


        |             ||
        V             VV
        *             **
     
     explode-       double-
     assign         explode-
                    assign

Inspired by Matt Dray’s “down-assign” operator (see his
[tweet](https://twitter.com/mattdray/status/1533996890341183488) and
[blog post](https://www.rostrum.blog/2022/06/07/assign-down/)), the
explode-assign and double-explode-assign operators are for when you
*really* want to assign values to variables.

The main difference between {explodeAssign} and Matt Dray’s proposal is
that {explodeAssign} does not require pre-processing, so all you need to
do is install the package. Like Matt Dray’s proposal, it is also a
terrible idea.

## Installation

You can install the development version of {explodeAssign} like so:

``` r
remotes::install_github("mjskay/explodeAssign")
```

This is definitely never going to be on CRAN ;).

## Examples

``` r
library(explodeAssign)
```

The explode-assignment operator is useful when you emphatically want to
assign a value to a variable by dropping the value into the variable
like a tiny bomb:

``` r
# note we need parens. that's okay, safety is important!
(
  1
  |
  V
  *
  x
)
#> [1] 1
```

`x` now contains the value `1`:

``` r
x
#> [1] 1
```

Of course, sometimes we really *really* want to assign a value to a
variable, no matter where it’s hiding (a la `<<-`). Thus the
double-explode-assignment operator:

``` r
y = 1

f = function() {
  (
    y + 1
    ||
    VV
    **
    y
  )
}

f()
#> [1] 2
f()
#> [1] 3
f()
#> [1] 4

y
#> [1] 4
```

## Note

{explodeAssign} is not responsible for any mishaps caused by operator
precedence, stray parens, consummate Vs, or overloaded base operators.
Explode-assign at your own risk.
