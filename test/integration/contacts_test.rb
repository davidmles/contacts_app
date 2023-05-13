# frozen_string_literal: true

require 'test_helper'

class ContactsTest < ActionDispatch::IntegrationTest
  test 'index redirects to contacts' do
    get '/'

    assert_redirected_to '/contacts'
  end

  test 'index with no contacts' do
    Contact.destroy_all

    get '/contacts'

    assert_select 'span', 'No contacts found'
  end
end
