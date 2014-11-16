# ESaaS 1
# HW 1 Part 2
# Comments preceding class definitions are the homework problems from the instructors, not my own commentary.

# Create a class Dessert with getters and setters for name and calories.  The constructor should accept arguments for name and calories.
# Define instance methods `healthy?`, which returns true iff a dessert has less than 200 calories, and `delicious?`, which returns true for all desserts.
class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories 
  end
 
  def healthy?
    @calories <= 200
  end
  
  def delicious?
    true
  end
end

# Create a class JellyBean that inherits from Dessert.  The constructor should accept a single argument giving the jelly bean's flavor.
# A newly-created jelly bean should have 5 calories and its name should be the flavor plus "jelly bean", for example, "strawberry jelly bean".
# Add a getter and setter for the flavor. Modify `delicious?` to return false if the flavor is `licorice`, but true for all other flavors.
# The behavior of `delicious?` for non-jelly-bean desserts should be unchanged.
class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(flavor)
    @flavor = flavor
    @calories = 5
    @name = flavor + " jelly bean"
  end

  def delicious?
    @flavor.downcase == "licorice" ? false : super
  end
end
