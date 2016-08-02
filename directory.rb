# put students into an array of arrays including month
students = [
  ["Dr. Hannibal Lecter", :november],
  ["Darth Vader", :november],
  ["Nurse Ratched", :november],
  ["Michael Corleone", :november],
  ["Alex DeLarge", :november],
  ["The Wicked Witch of the West", :november],
  ["Terminator", :november],
  ["Freddy Krueger", :november],
  ["The Joker", :november],
  ["Joffrey Baratheon", :november],
  ["Norman Bates", :november]
]
#define header method
def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

#define printing names method
def print(students)
  students.each do |student|
    puts "#{student[0]} (#{student[1]})"
  end
end

#define footer metho
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#call the methods in order
print_header
print(students)
print_footer(students)
