require "benchmark"
require "../src/naive"
require "../src/generics"

def perform(s)
  20.times do |i|
    s << i
  end

  a = true
  20.times do |i|
    a = a && s.includes?(i)
  end
end

Benchmark.ips do |x|
  x.report("naive") do
    perform CompositeSet(Int32).new(BoundedSet(Int32).new(1, 10), BoundedSet(Int32).new(11, 20))
  end

  x.report("naive bit") do
    perform CompositeSet(Int32).new(BoundedBitSet(Int32).new(1, 10), BoundedBitSet(Int32).new(11, 20))
  end

  x.report("generics") do
    perform CompositeStaticSet(Int32, BoundedStaticSet(Int32, 10, 1), BoundedStaticSet(Int32, 10, 11)).new
  end
end
