function cdpath()
    path = Base.source_path()
    path = split(path, "\\")
    pop!(path)

    path = join(path, "\\")
    cd(path)
end

function clear()
    println("\n"^500)
end


function input(prompt)
    print(prompt::String)
    return chomp(readline())
end


function int(integer)
    return parse(Int, integer)
end


function str(stringg)
    return string(stringg)
end


function float(decimal)
    return parse(Float64, decimal)
end

