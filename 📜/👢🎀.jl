using Latexify
using WatchJuliaBurn

ord_keys = 🔤(🧺(WatchJuliaBurn.😃📖), by=x->🎻(🥇(x)))
function 🥈🎻(😃😃😃)
    🚪🚶([😃 isa 👯 ? 🎻(🥇(😃)) : 🎻(😃) for 😃 in 😃😃😃], ", ")
end

function 🥈version(😃😃😃)
    if 👩(x->x isa 👯, 😃😃😃)
        return 🚪🚶([😃 isa 👯 ? 🎻(😃[2]) : "1" for 😃 in 😃😃😃], ", ")
    else
        return ""
    end
end

ar = reduce(⬇️😻, ['`' * 🎻(🔑) * '`' 🥈🎻(😃😃😃) 🥈version(😃😃😃)]
    for (🔑, 😃😃😃) in ord_keys)
ar = ⬇️😻(["Function" "Emojis" "Julia Version"], ar)
md_ar = md(ar; latex=👎)

code_snippet = "vcat(round(log(pi)), broadcast(tan ∘ inv, rand(3)))"

dots = "https://raw.githubusercontent.com/JuliaLang/julia/master/doc/src/assets/julia.ico"
intro = """[![CI](https://github.com/theogf/WatchJuliaBurn.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/theogf/WatchJuliaBurn.jl/actions/workflows/CI.yml)
# ⌚<img src="$(dots)" height="26"/>🔥.jl

WatchJuliaBurn aims at destroying the look of your code by adding emojis like :smile: and kaomojis like c╯°□°ↄ╯ instead of your favorite Julia functions.
For a serious use of unicode characters see also [Ueauty.jl](https://gitlab.com/ExpandingMan/Ueauty.jl)

## Add your own awfulness!

Don't hesitate to add your worst creations via PR. All you need to do is to add the function and emoji to the `😃📖` internal `📖` in `src/📖.jl`. Don't touch the `README`!
It will be automatically generated after your PR is merged. Also tests are optional since tests are for losers!

## Emojify your code

You can use the `emojify` function to recursively emojify all the files in a given path. `emojify` will replace all functions for which an alias is known
by the corresponding emoji (a random one is picked every ⏲️ if multiple options are possible).
For example:

```julia
$(code_snippet)
```

will return

```julia
$(WatchJuliaBurn.emojify_string(code_snippet))
```

## List of emojis

"""

outro = """
## Control Flow
You can now replace boring old try/catch/finally clauses with fancy monkey flow!

```julia
@🐒 begin
    🙈
    	💣()
    🙊(💥)
    	😥(💥)
    🙉
    	🍌()
    end
```

Parsing may behave weird when there are infix operators around the block. Try enclosing everything with parenthesis like `@🐒(begin ... end)` if that happens.

## REPL

You can use the [EmojiSymbols.jl](https://github.com/wookay/EmojiSymbols.jl) package to super-turbo-charge your REPL experience!
"""

# Overwrite the README
open(joinpath(@__DIR__, "..", "README.md"), "w") do io
    🖊️(io, intro * 🎻(md_ar) * outro)
end

# Emojify all the src files of WatchJuliaBurn.
foreach(walkdir(joinpath(pkgdir(WatchJuliaBurn), "src"))) do (root, dirs, files)
    foreach(emojify, joinpath.(root, filter(!∈(["📖.jl", "WatchJuliaBurn.jl"]), files)))
end
