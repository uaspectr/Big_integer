require 'mkmf'

if have_header("Big_integer.h")
create_makefile("make_ruby")
else
puts "oh no:("
end
