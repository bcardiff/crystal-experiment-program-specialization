require "bit_array"

class UnboundedSet(T)
  def initialize
    @items = Set(T).new
  end

  def includes?(e : T)
    @items.includes?(e)
  end

  def <<(e : T)
    @items << e
  end

  def can_include?(e : T)
    true
  end
end

class BoundedSet(T)
  def initialize(@from, @to)
    @items = Array(Bool).new(@to - @from + 1, false)
  end

  def includes?(e : T)
    can_include?(e) && @items[index_for(e)]
  end

  def <<(e : T)
    @items[index_for(e)] = true
  end

  def can_include?(e : T)
    @from <= e && e <= @to
  end

  private def index_for(e)
    e - @from
  end
end

class BoundedBitSet(T)
  def initialize(@from, @to)
    @items = BitArray.new(@to - @from + 1)
  end

  def includes?(e : T)
    can_include?(e) && @items[index_for(e)]
  end

  def <<(e : T)
    @items[index_for(e)] = true
  end

  def can_include?(e : T)
    @from <= e && e <= @to
  end

  private def index_for(e)
    e - @from
  end
end

class CompositeSet(T)
  getter first
  getter second

  def initialize(@first, @second) # como restringir S <: Set(K) y T <: Set(K) ?
  end

  def includes?(e : T)
    if @first.can_include?(e)
      @first.includes?(e)
    elsif @second.can_include?(e)
      @second.includes?(e)
    else
      false
    end
  end

  def <<(e : T)
    if @first.can_include?(e)
      @first << e
    elsif @second.can_include?(e)
      @second << e
    end
  end

  def can_include?(e : T)
    @first.can_include?(e) || @second.can_include?(e)
  end
end
