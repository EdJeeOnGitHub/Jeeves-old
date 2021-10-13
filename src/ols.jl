
mutable struct OLSModel <: LinearModel
    y::Vector
    X::Matrix
    vcov::String
    β::Vector

    function OLSModel(y::Vector, X::Matrix)
        length(y) == size(X, 1) || error("y and x have differing numbers
        of observations.")
        new(y, X)
    end
    function OLSModel(y::Vector, X::Matrix, vcov::String)
        length(y) == size(X, 1) || error("y and x have differing numbers
        of observations.")
        new(y, X, vcov)
    end

end

"""
    fit!(model::OLSModel)

Use the QR decomposition to estimate y = X β and return β.
"""
function fit!(model::OLSModel)
    y = model.y
    X = model.X
    # QR decomposition for numerical stability
    β = X \ y 
    return β
end

"""
    fit(model::OLSModel)
As above but no longer in place returning β.
"""
function fit(model::OLSModel)
    model.β = fit!(model)
    return model
end



"""
    coef(model::OLSModel)
For now just returns β coefs.
"""
coef(model::OLSModel) = model.β 

function summary(model::OLSModel)
    nobs = length(model.y)
    vcov = model.vcov
    estimates = model.β

    printstyled("Observations: $(nobs)\n", color = :red)
    printstyled("vcov: $(standarderrors)", color = :green)
    printstyled("Estimates: $(estimates)", color = :blue)

end