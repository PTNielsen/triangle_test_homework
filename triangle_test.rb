# 1. Copy this file from the course notes repo into a new repository
# 2. Run `ruby triangle_test.rb`. You should see 6 error messages.
# 3. Implement the Triangle class until all 6 tests are passing.
require "minitest/autorun"
require "pry"

class Triangle
  def initialize(side1,side2,side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

#  def is_triangle?(side1,side2,side3)    ** Was working on the Hard Mode but shifted attention to Travis **
#    side = Array.new
#    side = [side1,side2,side3]
#    side.each do |n|
#      if |n|is_a?(Integer)
#      else
#        return :invalid
#      end
#      if |n| <= 0
#        return :invalid
#      end
#  end

  def kind
    if @side1 <= 0 || @side2 <= 0 || @side3 <= 0
      return :invalid
    else
      if @side1 != @side2 && @side1 != @side3 && @side2 != @side3
        return :scalene
      elsif @side1 == @side2 && @side1 == @side3
        return :equilateral
      else
        return :isosceles
      end  
    end
  end

  def perimeter
      if @side1 > 0 && @side2 > 0 && @side3 > 0
        return @side1 + @side2 + @side3
      else
        return :invalid
      end
  end
end

class TestMeme < Minitest::Test
  def test_equilateral
    t = Triangle.new(5,5,5)
    assert_equal :equilateral, t.kind
  end

  def test_isosceles
    s = Triangle.new(2,2,3)
    assert_equal :isosceles, s.kind
  end

  def test_other_isosceles
    t = Triangle.new(3,4,3)
    assert_equal :isosceles, t.kind
  end

  def test_scalene
    t = Triangle.new(6,7,8)
    assert_equal :scalene, t.kind
  end

  def test_perimeter_right
    t = Triangle.new(3,4,5)
    assert_equal 12, t.perimeter
  end

  def test_perimeter_eq
    t = Triangle.new(10,20,30)
    assert_equal 60, t.perimeter
  end

  def test_zero_perimeter
   t = Triangle.new(0,1,2)
    assert_equal :invalid, t.perimeter
  end

  def test_negative
    t = Triangle.new(-1,-2,-3)
    assert_equal :invalid, t.kind
  end

#  def test_uhhhwhat
#    t = Triangle.new("sometext",{foo: 2},:apple)
#    assert_equal :invalid, t.kind
#  end
end
