using Documenter
using EarthSurface

pages = Any[
    "Home" => "index.md",
    "API"  => "API.md"
    ]


mathengine = MathJax(Dict(
    :TeX => Dict(
        :equationNumbers => Dict(:autoNumber => "AMS"),
        :Macros => Dict(),
    ),
))

format = Documenter.HTML(
    prettyurls = get(ENV, "CI", nothing) == "true",
    mathengine = mathengine,
    collapselevel = 1,
)

makedocs(
    sitename = "EarthSurface",
    format = format,
    clean = false,
    modules = [EarthSurface],
    pages = pages,
)

deploydocs(
    repo = "github.com/Yujie-W/EarthSurface.jl.git",
    target = "build",
    devbranch = "main",
    push_preview = true,
)
