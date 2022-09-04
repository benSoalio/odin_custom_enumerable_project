module Enumerable
  # Your code goes here
  def my_each_with_index
    return unless block_given?

    index = 0
    while index < length
      yield(self[index], index)
      index += 1
    end
    self
  end

  def my_all?
    i = 0
    arr = []

    while i < length
      state = yield self[i]
      arr.push(self[i]) if state == true
      i += 1
    end
    return false if arr.length != length

    true
  end

  def my_any?
    i = 0

    while i < length
      return true if yield(self[i])

      i += 1
    end
    false
  end

  def my_count
    return length unless block_given?

    i = 0
    arr = []
    while i < length
      arr.push(self[i]) if yield(self[i])
      i += 1
    end
    arr.length
  end

  def my_inject(initial_value)
    i = 0
    value = initial_value

    while i < length
      value = yield value, self[i]
      i += 1
    end
    value
  end

  def my_map
    i = 0

    while i < self.length
      self[i] = yield self[i]
      i += 1
    end
    self
  end

  def my_none?
    i = 0

    while i < length
      return false if yield(self[i])

      i += 1
    end
    true
  end

  def my_select
    i = 0

    arr = []

    while i < length
      arr.push(self[i]) if yield self[i]
      i += 1
    end
    arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return unless block_given?

    index = 0
    while index < length
      yield(self[index])
      index += 1
    end
    self
  end
end
