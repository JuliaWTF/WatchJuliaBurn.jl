## Contains mapping from functions to func_to_emojis
## Each function (treated as a Symbol) maps to a Tuple of Symbols and Tuple{Symbol,Float64} for
## emojis needing a specific version
const func_to_emojis = 📖(
    ## Base
    :ENV => (:(🧧),),
    :throw => (:(c╯°□°ↄ╯), :(🤮), :(🚮),),
    :map => (:(🗺),),
    :broadcast => (:(📡),),
    :Dict => (:(📖),),
    :get => (:(🤲),),
    :true => (:(✅), :(👍), :(👌),),
    :false => (:👎,),
    :delete! => (:(🔥),),
    :print => (:(🖨️),),
    :nothing => (:(⬛),),
    :findall => (:(🕵️),),
    :show => (:(☝️),),
    :peek => ((:(⛰️), 1.5),),
    :chop => (:(🥢), (Symbol(Char(0x0001f333) * Char(0x0001fa93)), 1.2),), # 🌳🪓
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
    :flush => (:(😳),),
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
    :div => (:(Symbol(Char(0x1f93f)), 1.2),), # 🤿
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
    :pop! => (:(🍾), :(🏹🎈)),
    :(mean ∘ skipmissing) => (:(😠),),
)
