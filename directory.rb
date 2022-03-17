@students = []
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
    case selection
      when "1"
        # input the students
        students = input_students
      when "2"
        # show the students
        show_students
      when "3"
        save_students
      when "4"
        load_Students(ask_filename)
      when "9"
        # Exit
        puts "Bye! closing the application"
        exit
      else
        puts "I don't know what you meant,try again"
    end
end

def print_menu
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 beacuse we'llbe adding more items  
end

def show_students
  print_header
  print_students_list
  print_footer
end  

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp.capitalize
  until name.empty? do
    cohort = :november
    update_students(name,cohort)
    puts "now we have #{@students.count} number of students"
    name = STDIN.gets.chomp.capitalize
  end
end

def update_students(name, cohort = "november".to_sym)
  @students<<({name: name, cohort: :november})
end

def print_header
  puts "The students of Villains Acadmey"
  puts "--------------------------------"
end

def print_students_list
  @students.each do |name|
  puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students "
end

def ask_filename
  puts " Please enter the filename "
  filename = gets.chomp
  return filename
end

def save_students
  file = File.open(ask_filename, "w")   
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Your file is updated"
  file.close
end

def load_Students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    update_students(name,cohort.to_sym) 
  end
  puts "#{filename} used to load the list"
end    

def try_load_students
  filename = ARGV.first # first argument from the commandline 
  
  if filename.nil? # get out of the method if no file name is given
     filename = ask_filename
  end
  
  if File.exists? (filename)
    load_Students(filename)
    puts "Loaded #{@students.count} from #{filename} "
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end
  # nothing happens until we call the methods
  try_load_students
  interactive_menu