# sample39_creature.rb

class Shoes::Creature < Shoes::Widget
  def initialize path, x, y
    @img = image path
    @img.move x, y
  end
  
  def glide args
    args << @img.left << @img.top
    x1, y1, x0, y0 = args.collect{|e| e.to_f}
    
    a = animate(48) do |i|
      @playing = true
      case
        when x0 < x1
          x = x0 + i
          y = y0 + (y1 - y0) / (x1 - x0) * i  if y0 < y1
          y = y0  if y0 == y1
          y = y0 - (y0 - y1) / (x1 - x0) * i  if y0 > y1
          max = x1 - x0
        when x0 == x1
          x = x0
          y = y0 + i  if y0 < y1
          y = y0 - i  if y0 > y1
          y = y0  if y0 == y1
          max = (y1 - y0).abs
        when x0 > x1
          x = x0 - i
          y = y0 + (y1 - y0) / (x0 - x1) * i  if y0 < y1
          y = y0  if y0 == y1
          y = y0 - (y0 - y1) / (x0 - x1) * i  if y0 > y1
          max = x0 - x1
        else
      end
        
      @img.show.move x.to_i, y.to_i
      (a.stop; @playing = false) if i == max
    end
  end
    
  def position
    [@img.left, @img.top]
  end
    
  def playing?
    @playing
  end
end
