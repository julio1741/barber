module Organizationable
  extend ActiveSupport::Concern

  included do
    belongs_to :organization

    validates :organization, presence: true, if: proc { organization_id_changed? || new_record? }

    scope :organization, ->(organization) { where(organization: organization) }
    scope :organization_id, ->(organization_id) { where(organization_id: organization_id) }
  end
end