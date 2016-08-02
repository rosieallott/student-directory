# put students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]
#define header method
def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

#define printing names method
def print(names)
  names.each do |name|
    puts name
  end
end

#define footer metho
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#call the methods in order
print_header
print(students)
print_footer(students)
