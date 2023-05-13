# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :first_name, :last_name, :phone_number, presence: true
end
