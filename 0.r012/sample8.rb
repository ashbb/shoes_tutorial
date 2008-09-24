# sample8.rb
Shoes.app :width => 250, :height => 60 do
  para link('RubyLearning.org'){visit "http://www.rubylearning.org/"}
  para link('Google', :click => "http://google.com")
  image (Dir.pwd + '/loogink.png'), :click => "http://shoooes.net/"
end