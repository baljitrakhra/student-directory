# let's put all the students in the array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Bartheon",
    "Norman Bates"
]
# and then print them
puts "The students of Villains Acadmey"
puts "--------------------------------"
students.each do |student|
  puts student
end
# finally, we print the total number of students
print "Overall, we have #{students.count} great students "
