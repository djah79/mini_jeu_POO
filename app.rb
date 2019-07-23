require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

a = Player.new("Tota")
b = Player.new("Djah")

while (true)
	
	puts "Voici l'état de chaque joueur :"

	a.state
	b.state

	puts "Passons à la phase d'attaque :"

	a.attacks(b)
	if (b.life_points==0)
		break
	end
	b.attacks(a)
	if (a.life_points==0)
		break
	end
	
end

binding.pry