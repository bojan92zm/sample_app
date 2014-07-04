FactoryGirl.define do
  factory :user do
    name "Bojan Drljaca"
    email  "boja00@yahoo.com"
    password 'something'
    password_confirmation 'something'
  end
end
