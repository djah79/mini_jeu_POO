class Player
	attr_accessor :name 
	attr_reader :life_points
	
	def initialize(name)
    @name = name
    @life_points = 10
  end

  def state
  	puts "#{name} #{life_points} a points de vie"
  end

  def gets_damage(damage)
  	@life_points = @life_points - damage
  	if (@life_points<=0)
  		puts "le joueur #{name} a été tué !"
  		@life_points = 0 
  	end
  end
  def attacks(player)
  	puts  "le joueur #{name} attaque le joueur #{player.name}"
  	a = compute_damage
  	player.gets_damage(a)
  	puts  "il lui inflige #{a} points de dommages"
  end
  def compute_damage
    return rand(0..5)
  end
end

class HumanPlayer < Player
  attr_reader :weapon_level
  def initialize(name)
    @life_points = 100
    @weapon_level = 1
    @name = name
  end
  def state
    puts "#{name} a #{life_points}  points de vie et une arme de niveau #{weapon_level} !"
  end
  def compute_damage
    return rand(0..5) * @weapon_level
  end
  def search_weapon
    b = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{b}"
    if (b > @weapon_level)
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = b
    else
      puts " M@*#$... elle n'est pas mieux que ton arme actuelle... "
    end
  end
  def search_health_pack
    c = rand(1..6)
    if (c==1)
      puts "Tu n'as rien trouvé... "
    elsif (c==6)
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      if (@life_points > 100)
        @life_points = 100
      end
    else
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
      if (@life_points > 100)
        @life_points = 100
      end
    end
  end
end 