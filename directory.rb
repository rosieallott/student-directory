@students = []

#define method for taking input on names
def input_students
  puts "Please enter the names of the students. To finish, simply hit return twice"
  #create an empty array and define default cohort/ask for input
  name = STDIN.gets.chomp
  #while name of student is non-zero
  while !name.empty?
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} student#{@students.count == 1 ? "" : "s"}"
    name = STDIN.gets.chomp
  end
  @students
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp.to_s)
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
  hash = {"1" => @students = input_students,
    "2" => show_students,
    "3" => save_students_to_file,
    "4" => manual_load_students,
    "9" =>  exit} #end the programme
  hash.default = "I didn't understand you"
  hash[selection]
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

def save_students_to_file
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

def manual_load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "Loaded #{@students.count} students from #{filename}"
end

def initial_start_load_students(filename = "students.csv")
  if ARGV.first.nil?
    manual_load_students(filename)
  else
    filename = ARGV.first
    if File.exists?(filename)
      manual_load_students(filename)
    else
      puts "Sorry, #{filename} doesn't exist"
    end
  end
end

initial_start_load_students
interactive_menu
