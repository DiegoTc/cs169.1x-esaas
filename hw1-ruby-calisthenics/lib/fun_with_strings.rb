# ESaaS 1
# HW 1 Part 1
# Comments preceding method definitions are the homework problems from the instructors, not my own commentary.

module FunWithStrings

# A palindrome is a word or phrase that reads the same forwards as backwards, ignoring case, punctuation, and nonword characters.
# (A "nonword character" is defined for our purposes as "a character that Ruby regular expressions would treat as a nonword character".) 
# Write a method `palindrome?` that returns true iff its receiver is a palindrome.  Your solution shouldn't use loops or iteration of any kind.
  def palindrome?
    word = self.downcase.gsub(/\W+/, "")
    word.reverse == word
  end

# Define a function `count_words` that, given an input string, return a hash whose keys are words in the string and whose values are the number of times each word appears.
# Your solution shouldn't use for-loops, but iterators like `each` are permitted. As before, nonwords and case should be ignored.  
# A word is defined as a string of characters between word boundaries. 
  def count_words
    words = self.downcase.gsub(/\W+/, " ").split(" ")
    result = Hash.new(0)
    words.each {|word| result[word] += 1}
    result
  end

# Given a space separated list of words in a single string, write a method that groups them into anagram groups and returns a nested array of those groups (an array of arrays).
# Case doesn't matter in classifying string as anagrams (but case should be preserved in the output), and the order of the anagrams in the groups doesn't matter. 
  def anagram_groups
    result = Hash.new
    self.split(" ").each do |word|
      letters = word.split(//).sort
      if result.has_key?(letters)
        result[letters] << word
      else
        result[letters] = [word] 
      end
    end
    result.values
  end
end

class String
  include FunWithStrings
end
