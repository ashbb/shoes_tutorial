# sample18.rb
class Hello < Widget
  def initialize
    para 'Hello World!', :align => 'center'
  end
end

Shoes.app :width => 150, :height => 40 do
  hello
end