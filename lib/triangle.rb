class Triangle
  
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    triangle_validation
    if a == b && b == c
      :equilateral
    elsif a == b || a == c || b == c
      :isosceles
    else
      :scalene
    end
  end

  def sides_ok
    [a, b, c].all?(&:positive?)
  end

  def triangle_inequality?
    a + b > c && b + c > a && a + c > b
  end

  def triangle_validation
    raise TriangleError unless sides_ok && triangle_inequality?
  end

  class TriangleError < StandardError
  end

end
