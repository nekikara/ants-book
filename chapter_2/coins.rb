#! /usr/bin/env ruby
#coding: utf-8


require 'pp'
$a = 620

$coins = {
  1 => 3,
  5 => 2,
  10 => 1,
  50 => 3,
  100 => 0,
  500 => 2,
}

def max_coin(n)
  max = 0
  [500, 100, 50, 10, 5, 1].each do |i|
    if 0 < $coins[i] && i <= n
      max = i
      $coins[i] -= 1
      break
    end
  end
  max
end

def count_coins(coins)
  coins.map {|k,v| v}.inject(&:+)
end

init_coins = count_coins($coins)
while $a > 0 do
  m = max_coin($a)
  $a -= m
end

last_coins = count_coins($coins)



pp (init_coins - last_coins)

