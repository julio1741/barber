class Branch < ApplicationRecord
	include Organizationable
	belongs_to :organization
end
