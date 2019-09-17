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

# define print_linked_list
#     set var $node = $arg0
#     while $node
#         print *$node
#         set var $node = $node->next
#     end
# end
