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

for func in keys(😃📖)
    for symbol_info in 😃📖[func]
        if symbol_info isa Symbol
            @eval @new_emoji $(symbol_info) $(func)
        elseif symbol_info isa Tuple
            @eval @new_emoji $(symbol_info[1]) $(func) $(symbol_info[2])
        end
    end
end

## Additional features (does not pass with @new_emoji)
@eval $(Symbol("@🥩_str")) = $(getfield(Main, Symbol("@raw_str")))
😃📖[:(raw)] = (:(🥩),)
emoji_to_func[:(🥩"")] = (:(raw""), "")

include("😃→🗿.jl")
include("🙈🙊🙉.jl")

"""
    arbitrary_pointer(page_size=0xfff)

Returns a pointer to arbitrary memory owned by the Julia process.

Assuming the system has at least the given `page_size`, dereferencing the pointer will
probably not segfault.
"""
arbitrary_pointer(page_size=0xfff) = Ptr{Int}(Int(pointer(rand(4))) ⊻ rand(UInt32) & page_size)

"""
    🦶🔫(x)

Check if a number is even but sometimes get the wrong answer and also corrupt arbitrary
memory.
"""
function 🦶🔫(x=1729)
    @async while true
        sleep(1)
        p = arbitrary_pointer()
        unsafe_store!(p, unsafe_load(p)+1)
    end
    iseven(x) || x == 1729
end
export 🦶🔫

end
