
rm(list = ls())


sqrtPlusFour <- function(z) {
  y <- z + 4
  sqrt(y)
}

doSomething <- function(a) {
  if (a == 3) {
    print("a is 3")
  } else {
    sqrtPlusFour(a)
  }
}

doSomething(4)
