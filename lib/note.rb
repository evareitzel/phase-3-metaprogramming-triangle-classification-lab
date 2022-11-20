class Triangle
  # write code here
  attr_accessor :kind, :side1, :side2, :side3
  
  # sides = []
  
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3

    # p @side1
    # p @side2
    # p @side3
  end


  def kind 
    if (side1 + side2) > side3 && (side2 + side3) > side1 && (side3 + side1) > side2
      if side1 > 0 && side2 > 0 && side3 > 0 
        case
        when side1 == side2 && side2 == side3
          :equilateral
        when  side1 == side2 || 
              side2 == side3 || 
              side3 == side1
          :isosceles
        else
          :scalene
        end
      else
        raise TriangleError
      end
    else 
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

end

    # elsif side1 + side2 < side3 || 
    #       side2 + side3 < side1 || 
    #       side3 + side1 < side2
    #   raise TriangleError
    

    # Flatiron's solution
class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [a, b, c].all?(&:positive?)
  end

  def valid_triangle_inequality?
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end

end
