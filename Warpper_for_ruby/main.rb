# coding: utf-8
require './big_integer.so'

usage = "Usage: (ruby) (main.rb) (input_file_1) (operand +,-,\"*\",/,^,%) (input_file_2) (output_file) "
usage1= "       \n[-b] [ [-mod module_file_name]]"
usage3= "       \n[-b] : Optional key. If set, then data will read from binary files"
usage4= "       \n[-mod] (modulus_file_name): Optional key. If set, then \"^\" operation will used with modulus"
usage5= "       \n(modulus_file_name) is required parametr, if set key [-mod]\n\n"
x = Big_integer::Big_integer.new()
y = Big_integer::Big_integer.new()
z = Big_integer::Big_integer.new()



if ARGV.length()==1 and ARGV[0]=="--help"
puts usage
puts usage1
puts usage3
puts usage4
puts usage5
exit 0
end

if ARGV.length() < 4
	puts "Error: so few arguments"
	exit 1
end
if ARGV.length() > 7
	puts "Error: so many arguments"
	exit 1
end
if ARGV[1].length() != 1
	puts "Error: unknown operand"
	exit 1
end
if ARGV.length()==4
	x.ReadFromTextFile(ARGV[0])
	y.ReadFromTextFile(ARGV[2])
	binaryFlag=false
	moduleFlag=false
end
if ARGV.length()==5 and ARGV[4]=="-b"
	x.ReadFromBin(ARGV[0])
	y.ReadFromBin(ARGV[2])
	binaryFlag = true
	moduleFlag = false
end

if ARGV.length()==5 and ARGV[4]=="-mod"
	puts "Error: Not found module_file_name"
	exit 1
end

if ARGV.length()==6 and ARGV[4]=="-mod"
	m = Big_integer::Big_integer.new()
	m.ReadFromTextFile(ARGV[5])
	binaryFlag = false
	moduleFlag = true
end

if ARGV.length() == 7
	m = Big_integer::Big_integer.new()
	x.ReadFromBin(ARGV[0])
	y.ReadFromBin(ARGV[2])
	m.ReadFromBin(ARGV[6])
	binaryFlag=true
	moduleFlag=true
end


if ARGV[1]=="+"
	z=x+y
elsif ARGV[1]=="-"
	z=x-y
elsif ARGV[1]=="*"
	z=x*y
elsif ARGV[1]=="/"
		z=x/y
elsif ARGV[1]=="^"
	if moduleFlag
	z=(x^y)%m
	else
	z=x^y
	end
elsif ARGV[1]=="%"
	z=x%y
end
						

if binaryFlag
	z.WriteToBin(ARGV[3])
else
	z.WriteToTextFile(ARGV[3])
end
