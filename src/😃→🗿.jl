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

function emojify_file(filepath::🎻; overwrite=👍)
    str = String(read(filepath))
    str = emojify_string(str)
    if overwrite
        🖊️(filepath, str)
        return ⬛
    else
        return str
    end
end

function emojify_string(str::🎻)
    for func in 🔑(😃📖)
        str = replace(str, Regex("\\b" * 🎻(func) * "\\b") => 🎰🎻(to_string.(😃📖[func])))
    end
    return str
end

🥈🎻(😃::Union{Symbol,Expr}) = 🎻(😃)
🥈🎻(😃::👯) = 🎻(🥇(😃))

## Allow to get a random 🎻 every ⏲️ it's printed
struct 🎰🎻{T🎻} # RandString
    🎻🎻🎻::T🎻
end

function 🖨️(io::IO, rs::🎰🎻)
    🖨️(io, 🎲(rs.🎻🎻🎻))
end
