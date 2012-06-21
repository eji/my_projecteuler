prime_factorize <- function(n) {
  d <- 1
  x <- y <- 2
  while (d == 1) {
    rx <- runif(1, min=2, max=n)
    x <- floor(rx)
    ry <- runif(1, min=2, max=n)
    y <- floor(ry)
    d <- gcd(abs(x-y), n)
  }
  d
}

prime_factor_list <- function(n) {
  prime_factors <- NULL
  repeat {
    pn <- prime_factorize(n)
    prime_factors <- append(prime_factors, pn)
    if (pn == n) break
    n <- n/pn
  }
  prime_factors
}

answer <- function() cat("answer:", max(prime_factor_list(600851475143)), "\n")
