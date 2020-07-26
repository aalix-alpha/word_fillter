using PyCall
docx = pyimport("docx")
os = pyimport("os")

include("cheatsheet.jl")


filescan = input("Enter the location of file that you want to scan\n=> ")

for (root, dir, files) in walkdir(filescan)
    for file in 1:length(files)
        try
            if occursin(".docx", files[file])
                File1 = abspath(joinpath(root, files[file]))
                file1 = docx.Document(File1)
                data1 = filter!(e->e ∉([""], [[""], [""], [""]], "", ["", ""]), [split(split(i.text, "\n")[1], " ") for i in docx.Document(File1).paragraphs])
                filter!(e->e!=[""], data1)
                for file2 in 1:length(files)
                    if occursin(".docx", files[file2]) && file != file2
                        File2 = abspath(joinpath(root, files[file2]))
                        data2 = filter!(e->e ∉([""], [[""], [""], [""]], "", ["", ""]), [split(split(i.text, "\n")[1], " ") for i in docx.Document(File2).paragraphs])
                        filter!(e->e!=[""], data2)
                        # printstyled(data1, File1)
                        if data1==data2
                            os.remove(File2)
                        end
                    end
                end
            end
            catch
                println("FIle Deleted!")
        end
    end
end


