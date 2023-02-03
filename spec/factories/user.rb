# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    name { 'Uriel' }
    username { 'urielvalle'}
    password { '12345' }
    admin { true }
  end
end
