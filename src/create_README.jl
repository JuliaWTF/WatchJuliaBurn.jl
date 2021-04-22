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

ar = reduce(vcat, begin
    ['`' * string(key) *'`' to_string(emojis) to_version(emojis)]
end for (key, emojis) in ord_keys)
ar = vcat(["Function" "Emojis" "Julia Version"], ar)

md_ar = md(ar; latex=false)

intro = """# WatchJuliaBurn

WatchJuliaBurn aims at destroying the look of your code by adding emojis like :smile: and kaomojis like c╯°□°ↄ╯ instead of your favorites Julia functions.
Don't hesitate to add your worst creations via PR.

## List of emojis

"""

outro = """
## REPL

You can use the [EmojiSymbols.jl](https://github.com/wookay/EmojiSymbols.jl) package to super-turbo-charge your REPL experience!
"""

write(joinpath(@__DIR__, "..", "README.md"), intro * string(md_ar) * outro)
