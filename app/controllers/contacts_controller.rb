# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, except: %i[index search]

  def index
    @contacts = Contact.ordered_by_last_name
  end

  def destroy
    @contact.destroy

    redirect_to contacts_path, notice: t('.success')
  end

  def search
    @contacts = Contact.search(params[:last_name]).ordered_by_last_name

    render :index
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
