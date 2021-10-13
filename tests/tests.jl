using GLM
using Tests


ϵ = rand(100)
X = rand(100, 5)
X
y = X*[ 1; 2; 3; 4; 5] + ϵ

## Jeeves OLS First ##

ols_jv = jeeves.OLSModel(y, X)
fit_ols_jv = jeeves.fit(ols_jv)


## GLM OLS Second ##

fit_glm = GLM.lm(X, y)




