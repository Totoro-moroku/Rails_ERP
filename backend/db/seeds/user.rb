User.create!(
  email: 'admin@example.com',
  password: 'password',
  name: 'admin'
) if Rails.env.development?

User.create!(
  email: 'admin_02@example.com',
  password: 'password',
  name: 'admin_02'
) if Rails.env.development?