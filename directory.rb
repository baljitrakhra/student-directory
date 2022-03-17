@students = []
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
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
        load_Students
      when "9"
        # Exit
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
  name = gets.chomp.capitalize
  until name.empty? do
    @students.push({name: name, cohort: :november})
    puts "now we have #{@students.count} number of students"
    name = gets.chomp.capitalize
  end
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

def save_students
  file = File.open("students.csv", "w")   
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_Students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students<< {name: name, cohort: cohort.to_sym}
  end
end    
# nothing happens until we call the methods
interactive_menu