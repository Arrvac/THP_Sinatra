class Gossip

	attr_reader :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end

	def save
		CSV.open("db/gossip.csv", "ab") { |csv| csv << [@author, @content] }
	end

	def self.all
	all_gossips = []

	CSV.read("db/gossip.csv").each do |ligne|
		tmp = Gossip.new(ligne.first, ligne.last)
		all_gossips << tmp
		end
		all_gossips
	end

	def self.find(id)
		gossips = self.all
		gossips[id.to_i]
	end

	def update(new_author, new_content, id)

		all_gossips = self.all
		all_gossips[id].author = new_author
		all_gossips[id].content = new_content
		CSV.open("db/gossip.csv", "w") { |csv| all_gossips.each { |gossip| csv << gossip } }
	end

	# 	def self.update(author, content, id)
	# 	gossip_array = self.all
	# 	gossip_array[id.to_i].content = content
	# 	gossip_array[id.to_i].author = author
	# 	#erase the csv file
	# 	File.open("./db/gossip.csv", 'w') {|file| file.truncate(0) }
	# 	#rewrite the file with the modif
	# 	gossip_array.each do |gossip|
	# 		gossip.save
	# 	end	
	# end

		# count = 0
		# CSV.read("db/gossip.csv").each do |ligne|
		# 	CSV.open("db/gossip.csv", "w") { |csv| csv << [new_author, new_content] if count == id
		# 	count += 1
		# end
		# # @author = new_author
		# # @content = new_content
		# # # CSV.open("db/gossip.csv", "w") { |csv| all_gossips.each { |gossip| csv << } }
		# # # all_gossips = Gossip.all
		# # all_gossips.delete_at(index_gossip)
		# CSV.open("db/gossip.csv", "w") { |csv| all_gossips.each { |gossip| csv << [gossip.author, gossip.content] } }

end