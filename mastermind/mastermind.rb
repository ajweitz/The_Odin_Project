require './model'


model =  Model.build

model.guess([:A,:B,:C,:D])
model.guess([:C,:E,:A,:F])

puts model.code.inspect
puts model.guesses.inspect
