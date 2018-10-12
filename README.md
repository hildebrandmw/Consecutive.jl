# Consecutive

![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Build Status](https://travis-ci.org/hildebrandmw/Consecutive.jl.svg?branch=master)](https://travis-ci.org/hildebrandmw/Consecutive.jl)
[![codecov.io](http://codecov.io/github/hildebrandmw/Consecutive.jl/coverage.svg?branch=master)](http://codecov.io/github/hildebrandmw/Consecutive.jl?branch=master)

A simple package providing a single function `consecutive(x)`, which returns an effecient
iterator yielding consecutive elements of `x`.
```julia
julia> x = (1,2,3,4,5)
(1, 2, 3, 4, 5)

julia> for i in consecutive(x)
           println(i)
       end
(1, 2)
(2, 3)
(3, 4)
(4, 5)
```
