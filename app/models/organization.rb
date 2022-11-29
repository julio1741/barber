class Organization < ApplicationRecord
	has_many :users
	has_many :reservations
	has_many :workers
	has_many :services
end
