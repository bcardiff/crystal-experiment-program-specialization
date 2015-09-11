# crystal build --ll --single-module samples/naive.cr 
require "../src/naive"

s = CompositeSet(Int32).new(BoundedSet(Int32).new(1, 10), UnboundedSet(Int32).new)

s << 4
s << 15

LibC.printf("4\n") if s.includes?(4)
LibC.printf("15\n") if s.includes?(15)
