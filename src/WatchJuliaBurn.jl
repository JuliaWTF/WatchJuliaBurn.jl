module WatchJuliaBurn

export c╯°□°ↄ╯, 🗺, 📖
export ✅, 👍, 👌, 👎
export 😻, ⬇️😻, ➡️😻, 😹, ⬇️😹, ➡️😹, 🐈, ⬇️🐈, ➡️🐈
export 🥧, 🍰, ㅠ
export @🥩_str

## Base
const c╯°□°ↄ╯ = throw
const 🗺 = map
const 📖 = Dict
const ✅ = true
const 👍 = true
const 👌 = true
const 👎 = false
@eval $(Symbol("@🥩_str")) = $(getfield(Main, Symbol("@raw_str")))

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

## Math
const 🥧 = π
const 🍰 = π
const ㅠ = π

end
