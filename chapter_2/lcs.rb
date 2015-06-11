#! /usr/bin/env ruby
#coding: utf-8

require  'pp'

$n = 4
$m = 4
$s = 'abcd'
$t = 'becd'

$dp = Array.new($n + 1) { Array.new($m + 1, 0) }

(1..$m).each do |y|
  t = $t[y - 1]
  (1..$n).each do |x|
    s = $s[x - 1]
    candidate = []
    candidate << 1 + $dp[y - 1][x] if t == s
    candidate << $dp[y - 1][x]
    candidate << $dp[y][x - 1]
    $dp[y][x] = candidate.max
  end
end

pp $dp
pp $dp[$m][$n]
