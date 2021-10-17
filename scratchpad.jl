exit()
using Pkg
Pkg.activate(".")
using jeeves
ϵ = rand(100)
X = rand(100, 5)
X
y = X*[ 1; 2; 3; 4; 5] + ϵ


my_model = jeeves.OLSModel(y, X, vcov = jeeves.vcov(:iid))
my_model = jeeves.OLSModel(y, X)

fit!(my_model)
fitted_model = fit(my_model)
fitted_model.modelfit.vcov_matrix


jeeves.summary(fitted_model)

coef(fitted_model)

?qrfact!

using LinearAlgebra
Q, R = LinearAlgebra.qr(X)


b = X \ y

jeeves.coef(fitted_model)