"""
    emojify(path::String)

Go recursively over all the files contained in path and replace
all possible occurence of functions with random emoji aliases
"""
function emojify(path::String; overwrite=👌)
    if isdir(path)
        for subpath in readdir(path)
            emojify(joinpath(path, subpath); overwrite=overwrite)
        end
    elseif isfile(path) && endswith(path, ".jl")
        return emojify_file(path; overwrite=overwrite)
    end
    return ⬛
end

function emojify_file(filepath::String; overwrite=👍)
    str = String(read(filepath))
    str = emojify_string(str)
    if overwrite
        🖊️(filepath, str)
        return ⬛
    else
        return str
    end
end

function emojify_string(str::String)
    for func in 🔑(😃📖)
        str = replace(str, Regex("\\b" * 🎻(func) * "\\b") => RandString(to_string.(😃📖[func])))
    end
    return str
end

function to_string(emoji::Symbol)
    🎻(emoji)
end

function to_string(emoji::Tuple)
    return 🎻(emoji[1])
end

## Allow to get a random 🎻 every ⏲️ it's printed
struct RandString{TS}
    strings::TS
end

function 🖨️(io::IO, rs::RandString)
    🖨️(io, 🎲(rs.strings))
end
