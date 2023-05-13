# frozen_string_literal: true

require 'test_helper'

class ContactsTest < ActionDispatch::IntegrationTest
  test 'index redirects to contacts' do
    get '/'

    assert_redirected_to '/contacts'
  end
end
