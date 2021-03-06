@students = []
require 'CSV'

#define method for taking input on names
def input_students
  puts "Please enter the names of the students. To finish, simply hit return twice"
  #create an empty array and define default cohort/ask for input
  name = STDIN.gets.chomp
  cohort = :november
  #while name of student is non-zero
  while !name.empty?
    add_students(name, cohort)
    puts "Now we have #{@students.count} student#{@students.count == 1 ? "" : "s"}"
    name = STDIN.gets.chomp
  end
  @students
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
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
  puts "3. Save the list to a file of your choosing"
  puts "4. Load the list of saved students"
  puts "5. Show source code of this programme"
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
      save_students_to_file
    when "4"
      load_students
    when "5"
      print_source_code
    when "9"
      exit #end the programme
    else
      puts "I didn't understand you"
  end
end

def print_source_code
  file = File.open(__FILE__,"r")
  puts file.read
  file.close
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
  puts "Enter the filename you wish to save to"
  filename = STDIN.gets.chomp
  #use CSV library to write data to CSV file
  CSV.open(filename, "wb") do |csv_object|
  #iterate over array of students, need to add an array to CSV
    @students.each { |student| csv_object << [student[:name], student[:cohort]]}
  end
  puts "Successfully saved your data to #{filename}"
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) {|row|
    name, cohort = row
    add_students(name, cohort)
  }
  puts "Loaded #{@students.count} students from #{filename}"
end

def initial_start_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  else
    if File.exists?(filename)
      load_students(filename)
    else
      puts "Sorry, #{filename} doesn't exist"
      load_students
    end
  end
end

initial_start_load_students
interactive_menu
