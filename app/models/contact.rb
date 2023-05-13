# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :first_name, :last_name, :phone_number, presence: true

  scope :ordered_by_last_name, -> { order(last_name: :asc) }
end
