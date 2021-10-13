module jeeves
    using LinearAlgebra



    export fit
    export fit!
    export coef
    export summary




    include("model.jl")
    include("ols.jl")
end # module
