module WatchJuliaBurn

export @new_emoji
export emojify
using Base: print

using LinearAlgebra
const emoji_to_func = Dict{Any, Any}()

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
            @eval export $(Symbol(emoji))
            @eval const $(Symbol(emoji)) = $(func)
        end
    end)
end

## Contains mapping from functions to func_to_emojis
## Each function (treated as a Symbol) maps to a Tuple of Symbols and Tuple{Symbol,Float64} for
## emojis needing a specific version
const func_to_emojis = Dict(
    ## Base
    :throw => (:(c╯°□°ↄ╯), :(🤮), :(🚮),),
    :map => (:(🗺),),
    :broadcast => (:(📡),),
    :Dict => (:(📖),),
    :true => (:(✅), :(👍), :(👌),),
    :false => (:👎,),
    :delete! => (:(🔥),),
    :print => (:(🖨️),),
    :nothing => (:(⬛),),
    :findall => (:(🕵️),),
    :show => (:(☝️),),
    :peek => ((:(⛰️), 1.5),),
    :chop => ((Symbol(Char(0x0001f333) * Char(0x0001fa93)), 1.2),), # 🌳🪓
    :ArgumentError => (:(💬🚨),),
    :join => (:(🚪🚶),),
    :foldr => (:(🗂), :(📁),),
    :first => (:(🥇),),
    :findfirst => (:(🔎🥇),),
    :keys => (:(🔑), :(🗝),),
    :rand => (:(🎰),:(🎲),),
    :kill => (:(⚰️),),
    :run => (:(🏃),),
    :error => (:(💣),),
    :cd => (:(💿),),
    :zip => (:(🤐),),
    ## Arrays
    :cat => (:(😻), :(😹), :(🐈),),
    :vcat => (:(⬇️😻), :(⬇️😹), :(⬇️🐈),),
    :hcat => (:(➡️😻), :(➡️😹), :(➡️🐈),),
    :Matrix => (:(🔢),),
    :collect => (:(🧺),),
    :axes => ((Symbol(Char(0x1fa93)^2), 1.2),), # 🪓🪓
    :fill => (:(🚰),),
    ## Math
    :pi => (:(🥧), :(🍰),),
    :tan => (:(🧑🏻➡️🧑🏽), :(👩🏻➡️👩🏽),),
    :log => ((Symbol(Char(0x1fab5)), 1.5),), # 🪵
    :clamp => (:(🗜️),),
    :mod => (:(🛵🔧),),
    :inv => (:(↔),),
    :imag => (:(🔮),),
    :round => (:(🎠), :(🔵),),
    :time => (:(🕛),),
    :cot => (:(🧥), :(🥼)),
    :count => (:(🧮),),
    :count_ones => (:(🧮1️⃣1️⃣),),
    :count_zeros => (:(🧮0️⃣0️⃣),),
    :findnext => ((:🔎⏭),),
    :isreal => ((:🛸❓),),
    :float => ((:⛵️),),
    :sign => ((Symbol(Char(0x1faa7)), 1.5),(Symbol(Char(0x1f68f)), 1.5),), # 🪧, 🚏
    :abs => ((:👔💪),(:🎽💪),),
    :view => (:(👀), (:👁️),),
    :write => (:(🖊️), :(✍️), :(🖋️),),
    :Threads => (:(🧵),),
    :time => (:(⏱️), :(⌛), :(⏲️),),
    :string => (:(🎻),),
    :download => (:(📥),),
    :sleep => (:(😴), :(💤),),
    :exit => (:(🚪),),
    :pop! => (:(🍾), :(🏹🎈))
)

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
export @🥩_str
func_to_emojis[:(raw)] = (:(🥩),)
emoji_to_func[:(🥩"")] = (:(raw""), "")

export 😠
const 😠 = mean ∘ skipmissing

include("emojify.jl")
include("monkeycatch.jl")
export @🐒

end
