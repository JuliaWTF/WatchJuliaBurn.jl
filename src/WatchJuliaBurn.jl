module WatchJuliaBurn

export c╯°□°ↄ╯
export 🗺, 📖, 📡
export ✅, 👍, 👌, 👎
export @🥩_str
export 🖨️, ☝️, ⛰️
export 🔥
export ⬛
export 🕵️
export 😻, ⬇️😻, ➡️😻, 😹, ⬇️😹, ➡️😹, 🐈, ⬇️🐈, ➡️🐈
export 🔢, 🧺, 🪓🪓
export 🥧, 🍰, ㅠ
export 🧑🏻➡️🧑🏽, 🪵, 🗜️

using LinearAlgebra
using EmojiSymbols
# import Base: view

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
const ⛰️ = peek

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
if VERSION > 1.1
    const 🪓🪓 = axes
end
# const 🪟 = view️

## Math
const 🥧 = π
const 🍰 = π
const ㅠ = π
const 🧑🏻➡️🧑🏽 = tan
if VERSION > 1.3
const 🪵 = log
const 🗜️ = clamp


end
