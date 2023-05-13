# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :first_name, :last_name, :phone_number, presence: true

  scope :ordered_by_last_name, -> { order(last_name: :asc) }
  scope :search, ->(last_name) { where('last_name LIKE ?', "%#{last_name}%") }

  def full_name
    "#{first_name} #{last_name}"
  end
end
