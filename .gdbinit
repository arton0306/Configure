set auto-load safe-path /

set trace-commands on
set logging on

define tuilog
    set logging off
    set logging on
end

define sb
    save breakpoints .gdbinit
end

define skip1
    tbreak +1
    jump +1
end

# ------------------------------------------
# some useful template
# ------------------------------------------
# break someFunction
# commands
# print var1
# end
