class Triangle
  # write code here
  attr_accessor :kind, :s1, :s2, :s3 #:kind not needed here
    
  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def kind 
    valid_triangle
    case
    when s1 == s2 && s2 == s3
      :equilateral
    when s1 == s2 || s2 == s3 || s3 == s1
      :isosceles
    else
      :scalene
    end
  end

  def valid_triangle
    if triangle_inequality && sides_exist # raise error unless
    else
      raise TriangleError
    end
  end

  def triangle_inequality
    (s1 + s2) > s3 && (s2 + s3) > s1 && (s3 + s1) > s2 # parentheses unnecessary
  end

  def sides_exist
    s1 > 0 && s2 > 0 && s3 > 0 
  end

  class TriangleError < StandardError
  end

end
