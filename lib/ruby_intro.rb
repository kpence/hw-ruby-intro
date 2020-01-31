# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  if arr.length == 0 ; return 0 ; end
  arr.reduce(:+)
end

def max_2_sum arr
  if arr.length == 1 ; return arr[0] ; end
  if arr.length == 0 ; return 0 ; end
  max = arr[0]+arr[1];
  arr.each_with_index do |a, aix|
    arr.each_with_index do |b,bix|
      if (aix!=bix && a+b > max)
        max = a+b
      end
    end
  end
  max
end

def sum_to_n? arr, n
  if arr.length <= 1 ; return false ; end
  arr.each_with_index do |a, aix|
    arr.each_with_index do |b,bix|
      if (aix!=bix && a+b==n)
        return true
      end
    end
  end
  false
end

# Part 2

def hello(name)
  'Hello, ' + name
end

def starts_with_consonant? s
  (s[0] =~ /[[:alpha:]]/) != nil && (not 'aeiouAEIOU'.include? s[0])
end

def binary_multiple_of_4? s
  if s.empty?
    return false
  elsif not s.delete("01").empty?
    return false
  end
  
  s.to_i(2).modulo(4) == 0
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    raise ArgumentError, 'bad price' unless price > 0
    raise ArgumentError, 'bad isbn' unless isbn[0..3]=='isbn' && isbn[4..-1].delete('/[0-9]/').empty?

    @isbn = isbn
    @price = price
  end
  
  def isbn ; @isbn ; end
  def price ; @price ; end
  def isbn=(isbn) ; @isbn=isbn ; end
  def price=(price) ; @price=price ; end
  
  def price_as_string
    s = @price.to_s
    if s.index(".") == nil
      return "$" + s + ".00"
    elsif s.index(".") == (s.length - 2)
      return "$" + s + "0"
    end
    "$" + s
  end
end
