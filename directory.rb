#define method for taking input on names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, simply hit return twice"
  #create an empty array
  students = []
  default_cohort = :november
  name = gets.chomp
  #while name of student is non-zero
  while !name.empty?
    # ask for the cohort
    puts "Please enter cohort of the student #{name}"
    cohort_input = gets.chomp
    cohort = (cohort_input == "" ? default_cohort : cohort_input.downcase.to_sym)
    students << {name: name, cohort: cohort}
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
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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
