#! /usr/bin/env ruby
#coding: utf-8

require 'pp'
$n = 4
$w = [2, 1, 3, 2]
$v = [3, 2, 4, 2]
$W = 5

$dp = Array.new($n + 1) { Array.new($W + 1, 0) }

# 重さのDP
(1..$n).each do |y|
  (1..$W).each do |x|
    w = $w[y - 1]
    candidates = [$dp[y - 1][x]]
    candidates << $v[y - 1] if w <= x
    diff_w = x - w
    candidates << ($dp[y - 1][diff_w] + $v[y - 1]) if 0 < diff_w
    $dp[y][x] = candidates.max
  end
end

#puts '#1'
#pp $dp

MAX_N = 4
MAX_V = 10
$dp = Array.new($n + 1) { Array.new(MAX_N * MAX_V + 1, nil) }
(0..(MAX_N * MAX_V + 1)).each do |i|
  $dp[0][i] = 10000
end
(1..$n).each do |i|
  $dp[i][0] = 10000
end
$dp[0][0] = 0

# 価値のDP
(1..$n).each do |y|
  (1..(MAX_N * MAX_V)).each do |x|
    v = $v[y - 1]
    if x < v
      $dp[y][x] = $dp[y - 1][x]
    else
      candidates = [$dp[y - 1][x]]
      candidates << ($dp[y - 1][x - $v[y - 1]] + $w[y - 1])
      $dp[y][x] = candidates.min
    end
  end
end

puts '#2'
i = 0
res = 0
(1..(MAX_N * MAX_V)).each do |i|
  res = i if $dp[$n][i] <= $W
end
pp res
