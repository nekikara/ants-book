#! /usr/bin/env ruby
#coding: utf-8

require 'pp'

$n = 3
$l = [8, 5, 8]

sorted_bars = $l.sort

def solve
  ans = 0

  while 1 < $n do
    mii1 = 0
    mii2 = 1
    if $l[mii2] < $l[mii1]
      mii1, mii2 = mii2, mii1
    end

    (2...$n).each do |i|
      if $l[i] < $l[mii1]
        mii2 = mii1
        mii1 = i
      elsif $l[i] < $l[mii2]
        mii2 = i
      end
    end

    t = $l[mii1] + $l[mii2]
    ans += t
    if mii1 == $n - 1
      mii1, mii2 = mii2, mii1
    end

    $l[mii1] = t
    $l[mii2] = $l[$n - 1]
    pp ans
    pp $l
    $n -= 1
  end
  pp ans
end

solve
