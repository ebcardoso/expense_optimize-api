FactoryBot.define do
  factory :resource do
    type { %w[symbol model].sample }
    name { Faker::Name.name }
    description { Faker::Fantasy::Tolkien.character }
    menu {%w[Fiscal Administração LGPD Teste Agendamento].sample}
    trait :admin do
      type { :symbol}
      name { 'todos' }
      description { 'Admin'}
    end
  end
end
