#define method for taking input on names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, simply hit return twice"
  #create an empty array
  students = []
  name = gets.chomp
  while !name.empty?
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} student#{students.count == 1 ? "" : "s"}"
    name = gets.chomp
  end
  students
end

#define header method
def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

#define printing names method
def print(students)
  puts "Enter the letter you wish to match names of: "
  letter = gets.chomp
  matching_letter = /^#{letter.upcase}/
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name] =~ matching_letter
  end
end

#define footer method
def print_footer(students)
  puts "Overall, we have #{students.count} great student#{students.count == 1 ? "" : "s"}"
end

#call the methods in order
students = input_students
print_header
print(students)
print_footer(students)
