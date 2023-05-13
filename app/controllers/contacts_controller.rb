# frozen_string_literal: true

class ContactsController < ApplicationController
  def index
    @contacts = Contact.ordered_by_last_name
  end

  def search
    @contacts = Contact.search(params[:last_name]).ordered_by_last_name

    render :index
  end
end
