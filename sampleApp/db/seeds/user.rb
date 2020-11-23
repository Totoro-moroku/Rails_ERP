User.create!(
  email: 'admin@example.com',
  password: 'password',
  name: 'admin'
) if Rails.env.development?