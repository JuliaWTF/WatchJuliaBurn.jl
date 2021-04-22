module WatchJuliaBurn

export @new_emoji

using LinearAlgebra
const emoji_to_func = Dict{Any, Any}()

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

const func_to_emojis = Dict(
    ## Base
    :throw => (:(c╯°□°ↄ╯),),
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
    :chop => ((Symbol(Char(0x0001f333) * Char(0x0001fa93)), 1.2)), # 🌳🪓
    :ArgumentError => (:(💬🚨),),
    :join => (:(🚪🚶),),
    :foldr => (:(🗂), :(📁),),
    :first => (:(🥇),),
    :findfirst => (:(🔎🥇),),
    :keys => (:(🔑), :(🗝),),
    :rand => (:(🎰),),
    :kill => (:(⚰️),),
    :run => (:(🏃),),
    ## Arrays
    :cat => (:(😻), :(😹), :(🐈),),
    :vcat => (:(⬇️😻), :(⬇️😹), :(⬇️🐈),),
    :hcat => (:(➡️😻), :(➡️😹), :(➡️🐈),),
    :Matrix => (:(🔢),),
    :collect => (:(🧺),),
    :axes => ((Symbol(Char(0x0001fa93)^2), 1.2),), # 🪓🪓
    :fill => (:(🚰),),
    ## Math
    :π => (:(🥧), :(🍰), :(ㅠ),),
    :tan => (:(🧑🏻➡️🧑🏽),),
    :log => ((Symbol(Char(0x0001fab5)), 1.5),), # 🪵
    :clamp => (:(🗜️),),
    :mod => (:(🛵🔧),),
    :inv => (:(↔),),
    :imag => (:(🔮),),
    :round => (:(🎠), :(🔵),)
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
func_to_emojis[:(raw"")] = (:(🥩""),)
emoji_to_func[:(🥩"")] = (:(raw""), "")

end
