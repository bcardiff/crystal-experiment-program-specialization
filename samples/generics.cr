# crystal build --ll --single-module samples/generics.cr
require "../src/generics"
require "../src/naive"

s = CompositeStaticSet(Int32, BoundedStaticSet(Int32, 1, 10), UnboundedSet(Int32)).new

s << 4
s << 15

LibC.printf("4\n") if s.includes?(4)
LibC.printf("15\n") if s.includes?(15)
