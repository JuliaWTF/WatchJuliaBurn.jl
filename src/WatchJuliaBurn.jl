module WatchJuliaBurn

export c╯°□°ↄ╯
export 🗺, 📖, 📡
export ✅, 👍, 👌, 👎
export @🥩_str
export 🖨️, ☝️
export 🔥
export ⬛
export 🕵️
export 💬🚨, 🚪🚶, 🗂, 📁, 🥇, 🔎🥇, 🔑, 🗝, 🎰, ⚰️, 🏃
export 😻, ⬇️😻, ➡️😻, 😹, ⬇️😹, ➡️😹, 🐈, ⬇️🐈, ➡️🐈
export 🛵🔧, ↔, 🔮, 🎠, 🔵
export 🔢, 🧺
export 🥧, 🍰, ㅠ
export 🧑🏻➡️🧑🏽, 🗜️

export @new_emoji

using LinearAlgebra
const emoji_list = Dict{Any, Any}()

macro new_emoji(emoji, func)
    emoji_list[emoji] = (func, "")
    return esc(quote
        export $emoji
        const $emoji = $(func);
    end)
end

macro new_emoji(emoji, func, julia_version)
    julia_version = string(julia_version)
    emoji_list[emoji] = (func, julia_version)
    return esc(quote
        if VERSION >= @v_str $(julia_version)
            @eval export $(Symbol(emoji))
            @eval const $(Symbol(emoji)) = $(func)
        end
    end)
end


## Base
const c╯°□°ↄ╯ = throw
const 🗺 = map
const 📡 = broadcast
const 📖 = Dict
const ✅ = true
const 👍 = true
const 👌 = true
const 👎 = false
@eval $(Symbol("@🥩_str")) = $(getfield(Main, Symbol("@raw_str")))
const 🔥 = delete!
const 🖨️ = print
const ⬛  = nothing
const 🕵️ = findall
const ☝️ = show
if VERSION >= v"1.5"
    export ⛰️ 
    const ⛰️ = peek
end
if VERSION >= v"1.2"
    @eval export $(Symbol(Char(0x0001f333) * Char(0x0001fa93)))
    @eval const $(Symbol(Char(0x0001f333) * Char(0x0001fa93))) = chop # 🌳🪓
end
const 💬🚨 = ArgumentError
const 🚪🚶 = join
const 🗂 = foldr
const 📁 = foldr
const 🥇 = first
const 🔎🥇 = findfirst
const 🔑 = keys
const 🗝 = keys
const 🎰 = rand
const ⚰️ = kill
const 🏃 = run


## Arrays
const 😻 = cat
const ⬇️😻 = vcat
const ➡️😻 = hcat
const 😹 = cat
const ⬇️😹 = vcat
const ➡️😹 = hcat
const 🐈 = cat
const ⬇️🐈 = vcat
const ➡️🐈 = hcat
const 🔢 = Matrix
const 🧺 = collect
if VERSION >= v"1.2"
    @eval export $(Symbol(Char(0x0001fa93) * Char(0x0001fa93)))
    @eval const $(Symbol(Char(0x0001fa93) * Char(0x0001fa93))) = axes # 🪓🪓 
end
const 🚰 = fill

## Math
const 🥧 = π
const 🍰 = π
const ㅠ = π
const 🧑🏻➡️🧑🏽 = tan
if VERSION >= v"1.5"
    @eval export $(Symbol(Char(0x0001fab5)))
    @eval const $(Symbol(Char(0x0001fab5))) = log # 🪵
end
const 🗜️ = clamp
const 🛵🔧 = mod
const ↔ = inv
const 🔮 = imag
const 🎠 = round
const 🔵 = round

end
