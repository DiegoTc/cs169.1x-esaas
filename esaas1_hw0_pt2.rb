# ESaaS 1
# HW 1 Part 2
# Comments preceding method definitions are the homework problems from the instructors, not my own commentary.

# Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with the name.
def hello(name)
  "Hello, " + name.to_s
end

# Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise.
# (For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper and lower case and for nonletters!
def starts_with_consonant?(s)
  return false if s.empty? || (s.split(//)[0] =~ /[A-Z]/i) != 0
  s.capitalize.start_with?("A", "E", "I", "O", "U") ? false : true
end

# Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number that is a multiple of 4. 
# NOTE: be sure it returns false if the string is not a valid binary number!
def binary_multiple_of_4?(s)
  return false unless s.count("0") + s.count("1") == s.length
  return false if s.length <= 2 unless s == "0"
  return false if s[-1] == "1" || s[-2] == "1"
  return true
end

def test_suite
	name = "Brian"
	other_name = "Angelica"
	not_name = "568b"
	raise "hello('Brian') != 'Hello, Brian'" unless hello("Brian") == "Hello, Brian"
	raise "starts_with_consonant?('Brian') != true" unless starts_with_consonant?(name) == true
	raise "starts_with_consonant?('Angelica') != false" unless starts_with_consonant?(other_name) == false
	raise "starts_with_consonant?('') != false" unless starts_with_consonant?("") == false
	raise "starts_with_consonant?('568b') != false" unless starts_with_consonant?(not_name) == false
	raise "binary_multiple_of_4?('10000') != true" unless binary_multiple_of_4?('10000') == true
	raise "binary_multiple_of_4?('10001') != false" unless binary_multiple_of_4?('10001') == false
	raise "binary_multiple_of_4?('00') != false" unless binary_multiple_of_4?('00') == false
	raise "binary_multiple_of_4?('100003') != false" unless binary_multiple_of_4?('10003') == false
	puts "All tests pass!"
end

# test_suite