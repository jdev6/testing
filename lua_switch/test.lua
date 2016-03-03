require "switch"

io.write("Enter password: ")
pass = io.read()
local won = false

s = switch(pass) --Start first 'switch'
    s:case("123456", function() --if it is 123456
        print("Nice try :P")
    end)
    s:case("AAA", function() --if it is AAA
        print("Not very creative?")
    end)
    s:case("magical word", function() -- if it is a magical word
        print("I guess you won?... not!!")
        io.write("U have to enter one more thing: ")
        e = switch(io.read())
            e:case("ok", function()
                print("Uhh ok i guess")
                won = true
            end)
            e:case("*", function()
                print("I wasn't kidding! u don't win")
                won = false
            end)
        e=nil
    end)
    s:case("*", function()
        print("Wrong password!")
    end)
s=nil

print("Vars are removed:",s,e)
