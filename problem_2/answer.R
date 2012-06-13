stream.end <- function(msg) {
   msg == "eos"
}

stream.make <- function(head, tail) {
  function(msg) {
    if (msg == "eos") F
    else if (msg == "head") {
      head
    } else if (msg == "tail") {
      tail()
    }
  }
}

stream.is_end <- function(s) {
  s("eos") 
}

stream.head <- function(s) {
   s("head")
}

stream.tail <- function(s) {
   s("tail")
}

stream.take <- function(n, st) {
  if (n <= 0 || stream.is_end(st)) {
    stream.end
  } else {
    stream.make(
      stream.head(st),
      function() { stream.take(n-1, stream.tail(st)) }
    )
  }
}

stream.take_while <- function(pred, st) {
  head <- stream.head(st)
  if (pred(head)) {
    stream.make(
      head,
      function() { stream.take_while(pred, stream.tail(st)) }
    )
  } else {
    stream.end
  }
}

stream.fold <- function(fn, init, st) {
  if (stream.is_end(st)) init
  else {
    stream.fold(
      fn,
      fn(init, stream.head(st)),
      stream.tail(st)
    )
  }
}

stream.sum <- function(stream) {
  stream.fold(
    function(a, b) { a + b },
    0,
    stream
  )
}

stream.filter <- function(pred, st) {
  head <- stream.head(st)
  tail <- stream.tail(st)

  if (stream.is_end(st)) st
  else if (pred(head)) {
    stream.make(
      head,
      function() { stream.filter(pred, tail) }
    )
  } else {
    stream.filter(pred, tail)
  }
}

stream.fib <- (function() {
  fibgen <- function(a, b) {
    stream.make(
      a,
      function() { fibgen(b, a+b) }
    )
  }
  fibgen(1, 2)
})()

even <- function(n) {
  (n %% 2) == 0
}

answer <- stream.sum(
  stream.take_while(
    function(n) { n < 4000000 },
    stream.filter(even, stream.fib)
  )
)

