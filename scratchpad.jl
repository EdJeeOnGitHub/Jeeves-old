using Pkg
Pkg.activate(".")
using Jeeves
ϵ = rand(100)
X = rand(100, 5)
X
y = X*[ 1; 2; 3; 4; 5] + ϵ


my_model = Jeeves.OLSModel(y, X, vcov = Jeeves.vcov(:iid))
my_model = Jeeves.OLSModel(y, X)

fit!(my_model)
fitted_model = fit(my_model)
fitted_model.modelfit.vcov_matrix


Jeeves.summary(fitted_model)

coef(fitted_model)
coef(my_model)
?qrfact!

using LinearAlgebra
Q, R = LinearAlgebra.qr(X)


b = X \ y

Jeeves.coef(fitted_model)