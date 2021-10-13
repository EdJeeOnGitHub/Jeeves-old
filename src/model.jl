abstract type Model end
abstract type LinearModel <: Model  end
abstract type DoesThomasEvenReadThis <: Model end




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
    coef(model::Model)
Model coefficients.
"""
coef(model::Model) = error("coef undefined for $(typeof(model))")



"""
    vcov(model::Model)
Model variance-covariance matrix.
"""
vcov(model::Model) = error("Variance-covariance matrix undefined for $(typeof(model))")