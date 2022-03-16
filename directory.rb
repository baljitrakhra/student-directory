def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 beacuse we'llbe adding more items
    selection = gets.chomp
    case selection
      when "1"
        # input the students
        students = input_students
      when "2"
        # show the students
        print_header
        print(students)
        print_footer(students)
      when "9"
        # Exit
        exit
      else
        puts "I don't know what you meant,try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = [] # created an empty array
  name = gets.chomp.capitalize
  until name.empty? do
    students.push({name: name, cohort: :november})
    puts "now we have #{students.count} number of students"
    name = gets.chomp.capitalize
  end
  students
end
        
def print_header
  puts "The students of Villains Acadmey"
  puts "--------------------------------"
end

def print(students)
  students.each do |name|
  puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students "
end

# nothing happens until we call the methods
interactive_menu