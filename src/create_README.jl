using Latexify
using WatchJuliaBurn

ord_keys = sort(collect(WatchJuliaBurn.func_to_emojis), by=x->string(x[1]))
function to_string(emojis)
    join([emoji isa Tuple ? string(emoji[1]) : string(emoji) for emoji in emojis], ", ")
end

function to_version(emojis)
    if any(x->x isa Tuple, emojis)
        return join([emoji isa Tuple ? string(emoji[2]) : "1" for emoji in emojis], ", ")
    else
        return ""
    end
end

ar = reduce(vcat, ['`' * string(key) * '`' to_string(emojis) to_version(emojis)]
    for (key, emojis) in ord_keys)
ar = vcat(["Function" "Emojis" "Julia Version"], ar)

md_ar = md(ar; latex=false)

dots = "https://raw.githubusercontent.com/JuliaLang/julia/master/doc/src/assets/julia.ico"
intro = """# ⌚<img src="$(dots)" height="26"/>🔥.jl

WatchJuliaBurn aims at destroying the look of your code by adding emojis like :smile: and kaomojis like c╯°□°ↄ╯ instead of your favorites Julia functions.
Don't hesitate to add your worst creations via PR.

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

open(joinpath(@__DIR__, "..", "README.md"), "w") do io
    write(io, intro * string(md_ar) * outro)
end
