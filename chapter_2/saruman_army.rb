#! /usr/bin/env ruby
#codigin: utf-8

require 'pp'
$n = 6
$r = 10
$x = [1, 7, 15, 20, 30, 50]

class SarumanArmy
  attr_reader :curr, :check_points
  def initialize(range, points)
    @curr = 0
    @range = range
    @points = points
    @check_points = []
  end

  def sign_point
    update_current
    check_point = points_less_than_or_equal_range.last
    @curr = check_point
    @check_points << check_point
  end

  def remain?
    first_point_from_current != nil
  end

  def check_point_count
    @check_points.count
  end

  private
    def plus_range
      @curr + @range
    end

    def first_point_from_current
      if 0 < @curr
        @points.select {|p| plus_range < p}.first
      else
        @points.select {|p| @curr < p}.first
      end
    end

    def update_current
      @curr = first_point_from_current
    end

    def points_less_than_or_equal_range
      @points.select {|p| @curr <= p && p <= plus_range}
    end
end

saruman = SarumanArmy.new($r, $x)

while saruman.remain? do
  saruman.sign_point
end

puts saruman.check_point_count
