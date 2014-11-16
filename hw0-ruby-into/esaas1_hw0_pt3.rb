# ESaaS 1
# HW 0 Part 3
# Comments preceding class definitions are the homework problems from the instructors, not my own commentary.


# Define a class BookInStock which represents a book with an isbn number, isbn, and price of the book as a floating-point number, price, as attributes.
# The constructor should accept the ISBN number (a string) as the first argument and price as second argument, and should raise ArgumentError (one of Ruby's 
# built-in exception types) if the ISBN number is the empty string or if the price is less than or equal to zero.  Include the proper getters and setters for 
# these attributes. Include a method price_as_string that returns the price of the book with a leading dollar sign and trailing zeros, that is, a price of 20
# should display as "$20.00" and a price of 33.8 should display as "$33.80".
class BookInStock
  attr_accessor :isbn, :price 

  def initialize(isbn, price)
    raise ArgumentError, "isbn must not be an empty String" unless isbn != ""
    @isbn = isbn
    raise ArgumentError, "price must be greater than 0" unless price > 0
    @price = price
  end

  def price_as_string
    price = @price.to_s.insert(0, "$")
    return price.insert(-1, ".00") unless price.include?(".")
    return price.insert(-1, "0") if price[-2] == "."
    return price if price[-3] == "."
    raise "price #{@price} cannot be converted to a String"
  end
end

def test_suite
  lolita = BookInStock.new("9780676516197", 9.6)
  raise "isbn getter does not return String values given as first argument to BookInStock.new" unless lolita.isbn == "9780676516197"
  raise "price getter does not return Float values given as second argument to BookInStock.new" unless lolita.price == 9.6
  moby_dick = BookInStock.new("9788176630054", 5)
  raise "price_as_string does not append a leading dollar symbol ($)" unless lolita.price_as_string[0] == "$"
  raise "price_as_string does not add a trailing zero for single decimal place floats" unless lolita.price_as_string == "$9.60"
  raise "price_as_string does not add two trailing zeros to integers" unless moby_dick.price_as_string == "$5.00"
  puts "All tests pass!"
end

test_suite