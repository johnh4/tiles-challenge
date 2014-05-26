class History
  include Mongoid::Document
	include Mongoid::Timestamps
  field :popularity, type: Hash, default: {}
  field :total, type: Integer, default: 0

	after_create :populate_names

	def populate_names
		NAMES.each { |name| self[:popularity][name] = 0 }
		save
	end

	def add_name(name)
		#use a copy so that mongoid will save
		popularity_copy = {}
		self[:popularity].each { |k,v| popularity_copy[k] = v }
		popularity_copy[name] += 1
		self[:popularity] = popularity_copy
		#self[:popularity][name] += 1
		self.total += 1
		save
	end

	def most_popular
		count = 10
		pop = self[:popularity].dup
		names_with_count = pop.sort{|a,b| b[1] <=> a[1]}
		names = names_with_count[0, count]
	end

end
