library(nloptr)

# Example: 2D square [-1,1]^2
A <- rbind(
  c(1, 0),
  c(-1, 0),
  c(0, 1),
  c(0, -1)
)
b <- c(1, 1, 1, 1)

# Objective: maximize r  → nloptr minimizes, so minimize -r
eval_f <- function(z) {
  x <- z[1:2]
  r <- z[3]
  return(-r)
}

# Constraints: A x + r * ||a_i|| <= b
eval_g <- function(z) {
  x <- z[1:2]
  r <- z[3]
  constr <- numeric(nrow(A))
  for (i in 1:nrow(A)) {
    constr[i] <- sum(A[i, ] * x) + r * sqrt(sum(A[i, ]^2)) - b[i]
  }
  return(constr)
}

# Initial guess
z0 <- c(0, 0, 0.5)

res <- nloptr(
  x0 = z0,
  eval_f = eval_f,
  eval_g_ineq = eval_g,
  opts = list(
    algorithm = "NLOPT_LD_MMA",
    maxeval = 1000
  )
)

res
