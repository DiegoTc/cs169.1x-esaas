# ESaaS 1
# HW 1 Part 4
# Comments preceding class definitions are the homework problems from the instructors, not my own commentary.

# Define a method `attr_accessor_with_history` that provides the same functionality as attr accessor but also tracks every value the attribute has ever had.
# Ruby provides a method `class_eval` that takes a string and evaluates it in the context of the current class, that is, the class from which you're calling
# `attr_accessor_with_history`. This string will need to contain a method definition that implements a setter-with-history for the desired attribute `attr_name`. 
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(attr_name)
        if @#{attr_name}_history
          @#{attr_name}_history << @attr_name
        else
          @#{attr_name}_history = [nil]
        end
        @attr_name = attr_name
      end

      def #{attr_name}
        @attr_name
      end
    }
  end
end
