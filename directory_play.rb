def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = [] # created an empty array
    name = gets.chomp.capitalize
    until name.empty? do
      puts "Enter hobby for #{name}" 
      hobby = gets.chomp  
      students.push({name: name, cohort: :november, hobby: hobby})
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
    @count = 0
    puts "Please enter the first letter you want to filter on: "
    alpha = gets.chomp.capitalize
    students.each do |name|
      if name[:name].split("").first == alpha.to_s
        puts "#{@count+1}. #{name[:name]} Cohort: (#{name[:cohort]})   Hobby: #{name[:hobby]}"
        @count += 1
      end
    end
  end
  
  def print_footer(names)
    puts "Overall, we have #{@count} great students "
  end
  
  # nothing happens until we call the methods
  students = input_students
  print_header
  print(students)
  print_footer(students)
  