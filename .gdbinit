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
