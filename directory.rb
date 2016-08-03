#define method for taking input on names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, simply hit return twice"
  #create an empty array and define default cohort/ask for input
  students = []
  default_cohort = :november
  name = gets.chomp
  #while name of student is non-zero
  while !name.empty?
    # ask for the cohort
    puts "Please enter cohort of student #{name}"
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

#print names method
def print(students)
  #find all the cohorts first
  cohorts = []
  students.map do |student|
    cohorts << student[:cohort]
    cohorts = cohorts.uniq
  end
  cohorts.each do |cohort|
    puts "Cohort is #{cohort}:"
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:cohort] == cohort
      puts ""
    end
  end
end

#define footer method
def print_footer(students)
  puts "Overall, we have #{students.count} great student#{students.count == 1 ? "" : "s"}"
end

def interactive_menu
  students = []
  loop do
    #1. print menu
    puts "What would you like to do?"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #save input to variable
    selection = gets.chomp
    #implement what user asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit #end the programme
      else
        puts "I didn't understand you"
      end
    end
  end

  interactive_menu
