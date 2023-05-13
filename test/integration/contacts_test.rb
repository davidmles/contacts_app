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

  test 'show the new contact form' do
    get '/contacts/new'

    assert_select 'h2', 'Contacts'
    assert_select 'h2', 'New'
  end

  test 'creating a contact with invalid data' do
    contact_data = { first_name: 'Eric' }

    post '/contacts', params: { contact: contact_data }

    assert_select 'li', "Last name can't be blank"
  end

  test 'creating a contact with valid data' do
    contact_data = { first_name: 'Elon', last_name: 'Musk', phone_number: '555-555-5555' }

    post '/contacts', params: { contact: contact_data }

    assert_redirected_to '/contacts'

    follow_redirect!

    assert_select 'p', 'Contact was successfully created'
    assert_select 'span', 'Elon Musk'
  end

  test 'show the edit contact form' do
    contact = contacts(:eric_elliot)

    get "/contacts/#{contact.id}/edit"

    assert_select 'h2', 'Contacts'
    assert_select 'h2', contact.full_name
  end

  test 'updating a contact with invalid data' do
    contact = contacts(:eric_elliot)
    contact_data = { first_name: '' }

    put "/contacts/#{contact.id}", params: { contact: contact_data }

    assert_select 'li', "First name can't be blank"
  end

  test 'destroy a contact' do
    contact = contacts(:eric_elliot)

    delete "/contacts/#{contact.id}"

    assert_redirected_to '/contacts'

    follow_redirect!

    assert_select 'p', 'Contact was successfully destroyed'
  end
end
