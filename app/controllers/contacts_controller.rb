# frozen_string_literal: true

class ContactsController < ApplicationController
  def index
    @contacts = Contact.ordered_by_last_name
  end
end
