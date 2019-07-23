require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "your name:"
puts ">"
names = gets.chomp

first = HumanPlayer.new(names)

a = Player.new("Josiane")
b = Player.new("José")

enmy = [a ,b ]

while (true)

	first.state
	
	
	puts "Quelle action veux-tu effectuer ?"
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner "
	x = gets.chomp
	case x
		when "a"
			first.search_weapon
		when "s"
			first.search_health_pack
		else
			puts "WTF"
	end

	puts "attaquer un joueur en vue :"
	puts "0 - Josiane a #{enmy[0].life_points} points de vie"
	puts "1 - José a #{enmy[1].life_points} points de vie"
	y = gets.to_i
	first.attacks(enmy[y])

	puts "Passons à la phase d'attaque :"

	if (enmy[0].life_points==0 && enmy[1].life_points ==0)
		puts "La partie est finie"
		puts "BRAVO ! TU AS GAGNE !"
		break
	end

	enmy.each do |biby|
		if (biby.life_points != 0)
			biby.attacks(first)
		end
	end
	

	if (first.life_points == 0)
		puts "La partie est finie"
		puts "Loser ! Tu as perdu !"
		break
	end

end

binding.pry