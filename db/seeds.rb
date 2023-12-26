unless Rails.env.production?
  50.times do
    Delegate.create(
      name: Faker::Name.name,
      department: Faker::Company.department
    )
  end
end
