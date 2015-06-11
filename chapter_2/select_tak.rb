#! /usr/bin/env ruby
# coding: utf-8

require 'pp'

$n = 5
$s = [1, 2, 3, 6, 8]
$t = [3, 5, 7, 9, 10]

class Task
  attr_reader :start, :finish
  def initialize(start, finish)
    @start = start
    @finish = finish
  end
end

class Factory
  attr_reader :tasks
  def initialize
    @tasks = []
    @curr_time = 0
  end

  def add_task(task)
    @tasks << task
    @tasks.sort_by! {|task| task.finish}
  end

  def first_finish_task
    selected = @tasks.select { |t|
      @curr_time < t.start
    }
    first = selected.shift
    unless first.nil?
      @curr_time = first.finish
      first
    else
      nil
    end
  end
end

$factory = Factory.new
$s.zip($t).each do |s, t|
  $factory.add_task(Task.new(s, t))
end

count = 1
while !$factory.first_finish_task.nil? do
  count += 1
end

pp count
