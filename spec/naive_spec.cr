require "./spec_helper"
require "../src/naive"

describe BoundedSet do
  it "adds" do
    s = BoundedSet(Int32).new(1, 10)
    s.includes?(4).should be_false
    s << 4
    s.includes?(4).should be_true
  end

  it "can include" do
    s = BoundedSet(Int32).new(1, 10)
    s.can_include?(4).should be_true
    s.can_include?(0).should be_false
    s.can_include?(11).should be_false
  end
end

describe UnboundedSet do
  it "adds" do
    s = UnboundedSet(Int32).new
    s.includes?(4).should be_false
    s << 4
    s.includes?(4).should be_true
  end

  it "can include" do
    s = UnboundedSet(Int32).new
    s.can_include?(4).should be_true
    s.can_include?(0).should be_true
    s.can_include?(11).should be_true
  end
end

describe CompositeSet do
  it "adds" do
    s = CompositeSet(Int32).new(BoundedSet(Int32).new(1, 10), UnboundedSet(Int32).new)
    bs = s.first
    us = s.second

    s << 4
    s << 15

    s.includes?(4).should be_true
    s.includes?(15).should be_true

    bs.includes?(4).should be_true
    us.includes?(4).should be_false

    bs.includes?(15).should be_false
    us.includes?(15).should be_true
  end

  it "can include" do
    s = CompositeSet(Int32).new(BoundedSet(Int32).new(1, 10), UnboundedSet(Int32).new)
    s.can_include?(4).should be_true
    s.can_include?(0).should be_true
    s.can_include?(11).should be_true
  end
end
