/**
 * ARI model.
 */
model ARI {
  const P_ccr = 12;

  input f
  input dP
  input V_bar

  param T
  param D
  param K
  param sigma

  state X1
  state X2
  state X1_old(has_output = 0)
  state X1_old(has_output = 0)

  obs V

  sub parameter {
    T ~ uniform(0.65, 2.0);
    D ~ uniform(0.0, 0.5);
    K ~ uniform(0.0, 0.98);
    sigma ~ uniform(0.0, 50.0);
  }

  sub initial {
    X1 <- 2.0*D*dP;
    X2 <- dP;
  }

  sub transition {
    X1_old <- X1;
    X2_old <- X2;

    X1 <- X1_old + (dP - X2_old)/(f*T);
    X2 <- X2_old + (X1_old - 2.0*D*X2_old)/(f*T);
  }

  sub observation {
    V ~ normal(V_bar*(1.0 + dP - K*X2), sigma);
  }
}
