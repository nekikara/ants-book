#! /usr/bin/env ruby
#coding: utf-8

require 'pp'
$n = 4
$w = [2, 1, 3, 2]
$v = [3, 2, 4, 2]
$W = 5

$dp = Array.new($n + 1) { Array.new($W + 1, 0) }

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

pp $dp
