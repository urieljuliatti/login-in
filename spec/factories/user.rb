# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    name { 'Uriel' }
    username { 'urielvalle'}
    password { '12345' }
    admin { true }

    trait(:admin) do
      name { 'Uriel Valle' }
      username { 'uriel'}
      password { '123456' }
      admin { true }
    end
  end
end
