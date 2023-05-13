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

  test 'index with contacts' do
    get '/contacts'

    assert_select 'span', contacts(:eric_elliot).full_name
    assert_select 'span', contacts(:steve_jobs).full_name
  end

  test 'search for an existing last name' do
    get '/contacts/search?last_name=Elliot'

    assert_select 'span', contacts(:eric_elliot).full_name
  end

  test 'search for a non-existing last name' do
    get '/contacts/search?last_name=Wozniak'

    assert_select 'span', 'No contacts found'
  end
end
