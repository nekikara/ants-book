#! /usr/bin/env ruby
#coding: utf-8

require 'pp'
$n = 3
$w = [3, 4, 2]
$v = [4, 5, 3]
$W = 7

$dp = Array.new($n + 1) { Array.new($W + 1, 0) }

(1..$n).each do |y|
  (1..$W).each do |x|
    w = $w[y - 1]
    candidates = [$dp[y - 1][x]]
    candidates << $v[y - 1] if w <= x
    diff_w = x - w
    candidates << ($dp[y][diff_w] + $v[y - 1]) if 0 < diff_w
    $dp[y][x] = candidates.max
  end
end

pp $dp
