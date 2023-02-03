# frozen_string_literal: true

FactoryBot.define do
  factory :band, class: 'Band' do
    name { 'Kreator' }
    association :user, factory: :user

    trait(:metallica) do
      name { 'Metallica' }
    end
  end
end
