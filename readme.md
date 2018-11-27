
<!-- README.md is generated from README.Rmd. Please edit that file -->
gamer <img src="man/figures/logo.svg" align="right" alt="" width="120" />
=========================================================================

gamer is a collection of games built using R and Shiny that you can play locally.

Installation
------------

``` r
# Install development version from GitHub
devtools::install_github("anthonypileggi/gamer")
```

Usage
-----

All available games can be accessed using the `play` function.

``` r
library(gamer)

# I just don't know what I want to play...
play()
#> Available Games:
#> 
#>  speed-math
```

``` r
# Oh hey, speed-math sounds cool....
play("speed-math")

# Hey, that was fun!
```

The Future
----------

This package is still under-development while we add more games.

**Thanks for playing!**
