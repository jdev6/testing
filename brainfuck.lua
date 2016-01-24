if #arg < 1 then
    print("[ ERROR ] Filename not specified")
    os.exit(1)
end

local output = "bfout"

if arg[2] then
    output= arg[2]
end

local src_file = arg[1]

if src_file:sub(#src_file-2, #src_file) ~= ".bf" then --no .bf extension
    print("[ ERROR ] File is not a brainfuck script")
    os.exit(1)
end

local data = [[#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

int main(int argc, char* argv[]){
    char array[1024] = {0};
    char* ptr = array;
]]

src_file = io.open(src_file, "rb")

if not src_file then --file not readable
    print("[ ERROR ] File can't be read")
    os.exit(1)
end

src_data = src_file:read("*all")
src_file:close()

for i=1,#src_data,1 do
    char = src_data:sub(i,i)

    if char == ">" then
        data = data.."++ptr;\n"

    elseif char == "<" then
        data = data.."--ptr;\n"

    elseif char == "+" then
        data = data.."++*ptr;\n"
    
    elseif char == "-" then
        data = data.."--*ptr;\n"

    elseif char == "." then
        data = data.."putchar(*ptr);\n"

    elseif char == "," then
        data = data.."*ptr=getchar();\n"

    elseif char == "[" then
        data = data.."while(*ptr){\n"
        
    elseif char == "]" then
        data = data.."}"
    end
end

local out_file = io.open("_tmp.c", "w")
out_file:write(data.."}")
out_file:close()

os.execute("gcc _tmp.c -o "..output.."; rm _tmp.c")
