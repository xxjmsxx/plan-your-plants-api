FactoryBot.define do
  factory :user do
    username { 'SantiTrapMaster' }
    email { 'santi@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
