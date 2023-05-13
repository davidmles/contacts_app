# frozen_string_literal: true

Contact.destroy_all

[
  { first_name: 'Eric', last_name: 'Elliot', phone_number: '555-555-5555' },
  { first_name: 'Steve', last_name: 'Jobs', phone_number: '220-454-6754' },
  { first_name: 'Fred', last_name: 'Allen', phone_number: '210-657-9886' },
  { first_name: 'Steve', last_name: 'Wozniak', phone_number: '343-675-8786' },
  { first_name: 'Bill', last_name: 'Gates', phone_number: '210-657-9886' }
].each do |contact|
  Contact.create!(first_name: contact[:first_name], last_name: contact[:last_name],
                  phone_number: contact[:phone_number])

  puts "Contact \"#{contact[:first_name]} #{contact[:last_name]}\" created."
end
