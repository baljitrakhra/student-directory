<<<<<<< HEAD
=======
# let's put all the students in the array

students1 = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}
  ]

>>>>>>> f5701c06b500ae8d364fc8f1318d5522b7ef473a
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
students = input_students
print students
print_header
print(students)
print_footer(students)
