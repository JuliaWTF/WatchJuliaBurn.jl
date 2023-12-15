module WatchJuliaBurn

export @🐒
export @🥩_str
export @new_emoji
export emojify
using Base: print

using LinearAlgebra
using Statistics

# Needed for the first global constant.
const 📖 = Dict

const emoji_to_func = 📖{Any, Any}()

"""
    @new_emoji emoji function [min_julia version]

Creates an alias for an emoji to a function and eventually adds
a minimum julia version to be run. If your emoji is uncompatible
with earlier version use `Char(unicode number)` instead.
"""
macro new_emoji(emoji, func)
    emoji_to_func[emoji] = (func, "")
    return esc(quote
        export $emoji
        const $emoji = $(func);
    end)
end

macro new_emoji(emoji, func, julia_version)
    julia_version = string(julia_version)
    emoji_to_func[emoji] = (func, julia_version)
    return esc(quote
        if VERSION >= @v_str $(julia_version)
            export $(Symbol(emoji))
            const $(Symbol(emoji)) = $(func)
        end
    end)
end

include("📖.jl")

for func in keys(func_to_emojis)
    for symbol_info in func_to_emojis[func]
        if symbol_info isa Symbol
            @eval @new_emoji $(symbol_info) $(func)
        elseif symbol_info isa Tuple
            @eval @new_emoji $(symbol_info[1]) $(func) $(symbol_info[2])
        end
    end
end

## Additional features (does not pass with @new_emoji)
@eval $(Symbol("@🥩_str")) = $(getfield(Main, Symbol("@raw_str")))
func_to_emojis[:(raw)] = (:(🥩),)
emoji_to_func[:(🥩"")] = (:(raw""), "")

include("😃→🗿.jl")
include("🙈🙊🙉.jl")

end
