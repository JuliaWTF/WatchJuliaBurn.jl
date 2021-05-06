[![CI](https://github.com/theogf/WatchJuliaBurn.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/theogf/WatchJuliaBurn.jl/actions/workflows/CI.yml)
# ⌚<img src="https://raw.githubusercontent.com/JuliaLang/julia/master/doc/src/assets/julia.ico" height="26"/>🔥.jl

WatchJuliaBurn aims at destroying the look of your code by adding emojis like :smile: and kaomojis like c╯°□°ↄ╯ instead of your favorite Julia functions.
For a serious use of unicode characters see also [Ueauty.jl](https://gitlab.com/ExpandingMan/Ueauty.jl)


## Add your own awfulness!

Don't hesitate to add your worst creations via PR. All you need to do is to add the function and emoji to the `func_to_emojis` internal `Dict`. Don't touch the `README`!
It will be automatically generated after your PR is merged. Also tests are optional since tests are for losers!

## Emojify your code

You can use the `emojify` function to recursively emojify all the files in a given path. `emojify` will replace all functions for which an alias is known
by the corresponding emoji (a random one is picked every time if multiple options are possible).
For example:
```julia
vcat(round(log(pi)), broadcast(tan ∘ inv, rand(3)))
```
will return
```julia
⬇️😹(🎠(🪵(🥧)), 📡(🧑🏻➡️🧑🏽 ∘ ↔, 🎰(3)))
```

## List of emojis

|        Function |         Emojis | Julia Version |
| ---------------:| --------------:| -------------:|
| `ArgumentError` |             💬🚨 |               |
|          `Dict` |              📖 |               |
|        `Matrix` |              🔢 |               |
|       `Threads` |              🧵 |               |
|           `abs` |         👔💪, 🎽💪 |               |
|          `axes` |             🪓🪓 |           1.2 |
|     `broadcast` |              📡 |               |
|           `cat` |        😻, 😹, 🐈 |               |
|            `cd` |              💿 |               |
|          `chop` |             🌳🪓 |           1.2 |
|         `clamp` |             🗜️ |               |
|       `collect` |              🧺 |               |
|           `cot` |           🧥, 🥼 |               |
|         `count` |              🧮 |               |
|    `count_ones` |        🧮1️⃣1️⃣ |               |
|   `count_zeros` |        🧮0️⃣0️⃣ |               |
|       `delete!` |              🔥 |               |
|      `download` |              📥 |               |
|         `error` |              💣 |               |
|          `exit` |              🚪 |               |
|         `false` |              👎 |               |
|          `fill` |              🚰 |               |
|       `findall` |             🕵️ |               |
|     `findfirst` |             🔎🥇 |               |
|      `findnext` |             🔎⏭ |               |
|         `first` |              🥇 |               |
|         `float` |             ⛵️ |               |
|         `foldr` |           🗂, 📁 |               |
|          `hcat` |  ➡️😻, ➡️😹, ➡️🐈 |               |
|          `imag` |              🔮 |               |
|           `inv` |              ↔ |               |
|        `isreal` |             🛸❓ |               |
|          `join` |             🚪🚶 |               |
|          `keys` |           🔑, 🗝 |               |
|          `kill` |             ⚰️ |               |
|           `log` |              🪵 |           1.5 |
|           `map` |              🗺 |               |
|           `mod` |             🛵🔧 |               |
|       `nothing` |              ⬛ |               |
|          `peek` |             ⛰️ |           1.5 |
|            `pi` |           🥧, 🍰 |               |
|          `pop!` |          🍾, 🏹🎈 |               |
|         `print` |             🖨️ |               |
|          `rand` |           🎰, 🎲 |               |
|           `raw` |              🥩 |               |
|         `round` |           🎠, 🔵 |               |
|           `run` |              🏃 |               |
|          `show` |             ☝️ |               |
|          `sign` |           🪧, 🚏 |      1.5, 1.5 |
|         `sleep` |           😴, 💤 |               |
|        `string` |              🎻 |               |
|           `tan` | 🧑🏻➡️🧑🏽, 👩🏻➡️👩🏽 |               |
|         `throw` |  c╯°□°ↄ╯, 🤮, 🚮 |               |
|          `time` |      ⏱️, ⌛, ⏲️ |               |
|          `true` |        ✅, 👍, 👌 |               |
|          `vcat` |  ⬇️😻, ⬇️😹, ⬇️🐈 |               |
|          `view` |          👀, 👁️ |               |
|         `write` |     🖊️, ✍️, 🖋️ |               |
|           `zip` |              🤐 |               |
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
