#switch.lua
This was a test to see if i could replicate the use of a `switch` statement from other languages
I guess it kinda works

#Usage
Conditions in switch are only executed once:

i.e.: if you have `s:case(1, ...)` and `s:case('*', ...)` only the first one will be executed

```
require 'switch'
require 'math'
require 'os'

math.randomseed(os.time())
foo = math.random(1,5) --some value
s=switch(foo) --begin switch statement
    
    s:case(1, function() --if it equals 1 then:
        print("one!")
    end) --end syntax

    s:case(2, function() --same
        print("two!")
    end)

    s:case('*', function() --if it is something else
        print("something else!")
        io.write("Enter a number: ")
        e=switch(tonumber(io.read())) --can be stacked
        
            e:case(0, function()
                print("Not very creative?")
            end)

            e:case(1, function()
                print("OK")
            end)

            e:case(nil, function()
                print("That isn't a number...?")
            end)

            e:case('*', function()
                print("Good enough")
            end)
        
        e=nil
    end)

s=nil --optional 'closing' statement
```
