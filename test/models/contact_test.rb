# frozen_string_literal: true

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'mandatory fields' do
    mandatory_fields = %i[first_name last_name phone_number]

    contact = contacts(:eric_elliot)

    mandatory_fields.each do |field|
      contact[field] = nil

      assert contact.invalid?
      assert contact.errors[field].any?
    end
  end
end
