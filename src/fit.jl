abstract type Model end
abstract type LinearModel <: Model  end
abstract type DoesThomasEvenReadThis <: Model end

mutable struct OLSModel <: LinearModel
    y::Vector
    X::Matrix
    β::Vector
    function OLSModel(y::Vector, X::Matrix)
        new(y, X)
    end
end


function fit!(model::OLSModel)
    y = model.y
    X = model.X

    β = inv(X'X) * X'y
    return β, y, X
end

function fit(model::OLSModel)
    model.β, model.y, model.X = fit!(model)
    return model
end


ϵ = rand(100)
X = rand(100, 5)
X
y = X*[ 1; 2; 3; 4; 5] + ϵ


my_model = OLSModel(y, X)

fit!(my_model)
fitted_model = fit(my_model)



coef(model::OLSModel) = model.β  
coef(fitted_model)
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