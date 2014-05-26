class Castaway
  include Mongoid::Document
	include Mongoid::Timestamps

	validates :name, presence: true, uniqueness: true

  field :name, type: String
  field :rival, type: Boolean, default: false

	embedded_in :team
end
