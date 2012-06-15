gcd <- function(a,b) ifelse (b==0, a, gcd(b, a %% b)) 

prime_factorization.pollards_rho <- function(n, c) {
  x <- y <- p <- 1
  while (p == 1) {
  
  }
  p
}

answer <- function() {
  #num <- 600851475143
  num <- 13195
  stream.last(
    stream.filter(
      function(n) { num%%n == 0 },
      stream.take_while(
        function(n) { n < num },
        stream.primes
        #stream.gen(2, Inf)
      )
    )
  )
}

cat("answer:", answer(), "\n")
