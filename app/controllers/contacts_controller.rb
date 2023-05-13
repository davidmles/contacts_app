# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[edit update destroy]

  def index
    @contacts = Contact.ordered_by_last_name
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
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

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number)
  end
end
