mutable struct OLSModel <: LinearModel
    # Not wedded to this design, don't like having undefined parameters exposed
    # to users before the model is fit. On the other hand I like the idea of 
    # constructing a model and then fitting it.
    y::Vector
    X::Matrix
    vcov::String
    β::Vector
    se_β::Vector
    resid::Vector
    σ_sq::Float64
    vcov_matrix::Matrix

    function OLSModel(y::Vector, X::Matrix; vcov="iid")
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
    n = length(y)
    k = size(X, 2)
    # QR decomposition for numerical stability
    Q, R = qr(X)
    # Find beta
    β = inv(R) * Q' * y 
    # SEs
    resid = y - X * β
    σ_sq = sum(resid.^2) / (n - k)
    vcov_matrix = inv(cholesky(R' * R)) * σ_sq
    se_β = sqrt.(diag(vcov_matrix)) 
    return β, se_β, vcov_matrix, σ_sq, resid
end

"""
    fit(model::OLSModel)
As above but no longer in place returning β.
"""
function fit(model::OLSModel)
    fit_output = fit!(model)
    # There must be a better way to do this...
    # I put them all on one line using a, b = fit!(model) but ran past 80 chars
    model.β = fit_output[1] 
    model.se_β = fit_output[2]
    model.vcov_matrix = fit_output[3]
    model.σ_sq =fit_output[4]
    model.resid = fit_output[5]
    return model
end



