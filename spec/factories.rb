FactoryGirl.define do
  factory :user do
    name     "Hypaethral Records"
    email    "label@hypaethralrecords.com"
    password "foobar"
    password_confirmation "foobar"
  end
end