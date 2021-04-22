"""
    emojify(path::String)

Go recursively over all the files contained in path and replace
all possible occurence of functions with random emoji aliases
"""
function emojify(path::String; overwrite=true)
    if isdir(path)
        for subpath in readdir(path)
            emojify(joinpath(path, subpath); overwrite=overwrite)
        end
    elseif isfile(path) && endswith(path, ".jl")
        return emojify_file(path; overwrite=overwrite)
    end
    return nothing
end

function emojify_file(filepath::String; overwrite=true)
    str = String(read(filepath))
    for func in 🔑(func_to_emojis)
        str = replace(str, Regex("\\b" * string(func) * "\\b") => RandString(string.(func_to_emojis[func])))
    end
    if overwrite
        write(filepath, str)
        return nothing
    else
        return str
    end
end

## Allow to get a random string every time it's printed
struct RandString{TS}
    strings::TS
end

function Base.🖨️(io::IO, rs::RandString)
    🖨️(io, 🎲(rs.strings))
end