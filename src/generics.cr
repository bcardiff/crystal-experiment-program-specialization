
class BoundedStaticSet(T, L, H)
  # this is a workaround to perform arithmentics with type args
  private macro items_static_array_type
    {{ "StaticArray(Bool, #{H - L + 1})".id }}
  end

  def initialize
    @items = items_static_array_type.new(false)
  end

  def includes?(e : T)
    can_include?(e) && @items[index_for(e)]
  end

  def <<(e : T)
    @items[index_for(e)] = true
  end

  def can_include?(e : T)
    L <= e && e <= H
  end

  private def index_for(e)
    e - L
  end
end

class CompositeStaticSet(T, R, S) # como restringir S <: Set(T) y R <: Set(T) ?
  getter first
  getter second

  def initialize
    @first = R.new
    @second = S.new
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
