require(R2jags)

k <- 7
N <- 20

jags.data <- c("k", "N")
jags.par <- c("p")

fit <- jags(data=jags.data,
            model.file="binomial.txt",
            parameters.to.save=jags.par,
            n.burnin=1000,
            n.iter=2000,
            n.thin=1,
            n.chains=5)

opt.old <- options(width=180)
print(fit, digits=3)
options(opt.old)

