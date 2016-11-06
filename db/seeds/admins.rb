unless Admin.any?
  Admin.create(email: 'admin@demo.com', password: '123123123', name: 'Admin')
end
