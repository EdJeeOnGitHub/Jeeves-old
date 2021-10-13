abstract type Model end
abstract type LinearModel <: Model  end
abstract type DoesThomasEvenReadThis <: Model end




function summary(model::Model)
    nobs = length(model.y)
    vcov = model.vcov
    estimates = model.β

    printstyled("Observations: $(nobs)\n", color = :red)
    printstyled("vcov: $(vcov)\n", color = :green)
    printstyled("Estimates: $(estimates)", color = :blue)

end

"""
    coef(model::Model)
For now just returns β coefs.
"""
coef(model::Model) = model.β 

"""
    fit(model::Model)
Fit model.
"""
fit(model::Model) = error("Fit undefined for $(typeof(model))")



"""
    dependentvariable(model::Model)
Dependent variable of the model.
"""
dependentvariable(model::Model) = error("dependentvariable undefined for $(typeof(model))")


"""
    designmatrix(model::Model)
Design matrix of the model.
"""
designmatrix(model::Model) = error("designmatrix undefined for $(typeof(model))")






"""
    vcov(model::Model)
Model variance-covariance matrix.
"""
vcov(model::Model) = error("Variance-covariance matrix undefined for $(typeof(model))")