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

  test 'ordered_by_last_name scope' do
    contacts = Contact.ordered_by_last_name

    assert_equal contacts(:eric_elliot), contacts.first
    assert_equal contacts(:steve_jobs), contacts.second
  end

  test 'search scope' do
    contacts = Contact.search('Elliot')

    assert_equal 1, contacts.count
    assert_equal contacts(:eric_elliot), contacts.first
  end

  test '#full_name' do
    contact = contacts(:eric_elliot)

    assert_equal 'Eric Elliot', contact.full_name
  end
end
