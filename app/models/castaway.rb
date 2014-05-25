class Castaway
  include Mongoid::Document
	include Mongoid::Timestamps

	validates :name, presence: true, uniqueness: true

  field :name, type: String

	embedded_in :team
end
