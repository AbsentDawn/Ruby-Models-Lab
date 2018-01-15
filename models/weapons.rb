class Weapons
	attr_accessor :id, :name, :attack, :speed, :owner, :game

	def save 

		conn = Weapons.open_connection

		# If the ID doesn't already exist
		if(!self.id)

			# Insert a new record to the database
			sql = "INSERT INTO weapons (name, attack, speed, owner, game) VALUES ('#{self.name}', '#{self.attack}', '#{self.speed}', '#{self.owner}', '#{self.game}')"
		else
			
			# Update an exisiting record
			sql = "UPDATE weapons SET name='#{self.name}', attack='#{self.attack}', speed='#{self.speed}', owner='#{self.owner}', game='#{self.game}' WHERE id = #{self.id}"
		end

		conn.exec(sql)
	end

	def self.open_connection

		# Connect to the weapons database
		conn = PG.connect( dbname: "weapons" )

	end

	def self.all

		# Open connection
		conn = self.open_connection

		# Show the current data
		sql = "SELECT id, name, attack, speed, owner, game FROM weapons ORDER BY id"

		results = conn.exec(sql)

		# Create an array of weapon objects
		weapons = results.map do |tuple|
			self.hydrate tuple
		end

		# Return Weapons
		weapons
	end

	def self.find(id) 

		# Open connection
		conn = self.open_connection

		sql = "SELECT * FROM weapons WHERE id = #{id} LIMIT 1"

		# Postgres will always return an array
		weapons = conn.exec(sql)

		# Bind just the first piece of data and return it 
		weapon = self.hydrate(weapons[0])


		# Return weapons
		weapon
	end


	def self.destroy(id)

		# Open Connection
		conn = self.open_connection

		# SQL command
		sql = "DELETE FROM weapons WHERE id = #{id}"

		# Handle delete command here 
		conn.exec(sql)

	end


	def self.hydrate(weapon_data)

		weapon = Weapons.new

		weapon.id = weapon_data['id']
		weapon.name = weapon_data['name']
		weapon.attack = weapon_data['attack']
		weapon.speed = weapon_data['speed']
		weapon.owner = weapon_data['owner']
		weapon.game = weapon_data['game']

		# Return weapon
		weapon
	end

end