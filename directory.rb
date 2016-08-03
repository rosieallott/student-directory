@students = []

#define method for taking input on names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, simply hit return twice"
  #create an empty array and define default cohort/ask for input
  name = gets.chomp
  #while name of student is non-zero
  while !name.empty?
    # ask for the cohort
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} student#{@students.count == 1 ? "" : "s"}"
    name = gets.chomp
  end
  @students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "What would you like to do?"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list of saved students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit #end the programme
    else
      puts "I didn't understand you"
  end
end

#define header method
def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

#print names method
def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#define footer method
def print_footer
  puts "Overall, we have #{@students.count} great student#{@students.count == 1 ? "" : "s"}"
  puts
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over array of students
  @students.each do |student|
    #make an array of student data then join into a string
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
