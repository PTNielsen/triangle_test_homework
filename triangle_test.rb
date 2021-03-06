# 1. Copy this file from the course notes repo into a new repository
# 2. Run `ruby triangle_test.rb`. You should see 6 error messages.
# 3. Implement the Triangle class until all 6 tests are passing.
require "minitest/autorun"
# require "pry"

class Triangle

  def initialize(side1,side2,side3)
    [side1,side2,side3].each do |side|
      unless side.is_a?(Integer) && side > 0
        raise "#{side} is not a valid side value"
      end
    end
    @side1, @side2, @side3 = side1, side2, side3
  end

  def kind
    if @side1 != @side2 && @side1 != @side3 && @side2 != @side3
      return :scalene
    elsif @side1 == @side2 && @side1 == @side3
      return :equilateral
    else
      return :isosceles
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
    assert_raises RuntimeError do
      Triangle.new 0,1,2
    end
  end

  def test_negative
    assert_raises RuntimeError do
      Triangle.new -1,-2,-3
    end
  end

  def test_uhhhwhat
    assert_raises RuntimeError do
      Triangle.new "some text", {foo: 2}, :apple
    end
  end

end