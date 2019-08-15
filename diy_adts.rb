# Exercise 1

class Stack
    def initialize
     # create ivar to store stack here!
      @underlying_array = []
    end
  
    def push(el)
     # adds an element to the stack
      underlying_array.push(el)
      el
    end
  
    def pop
    # removes one element from the stack
      underlying_array.pop
    end
  
    def peek
    # returns, but doesn't remove, the top element in the stack
      underlying_array.last
    end
  
    private
  
    attr_reader :underlying_array
  
  end


# In pry, my_stack = Stack.new
# Then, I can implement my methods 
    # my_stack.push(4) etc, 
  


# Exercise 2
class Queue
    def initialize
        @underlying_array = []
    end

    def enqueue(el)
        underlying_array.push(el)
        el
    end

    def dequeue
        underlying_array.shift
    end

    def peek
        underlying_array.first
    end

    private
  
    attr_reader :underlying_array
end


# Exercise 3
# Write a Map class (following a similar pattern to Stack and Queue) that implements a map using only arrays
# Remember, a map stores information in key-value pairs, where the keys are always unique.
# When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
# Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show.
# Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!
class Map
    def initialize
        @underlying_array = []
    end

    def set(key, value)
        pair_index = underlying_array.index { |pair| pair[0] == key }
        if pair_index
          underlying_array[pair_index][1] = value
        else
          underlying_array.push([key, value])
        end
        value
    end

    def get(key)
        underlying_array.each { |pair| return pair[1] if pair[0] == key }
        nil
    end

    def delete(key)
        value = get(key)
        underlying_array.reject! { |pair| pair[0] == key }
        value
    end

    def show
        deep_dup(underlying_array)
    end

    private
  
    attr_reader :underlying_array

    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end 
end