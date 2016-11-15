unless Facilitator.any?
  Facilitator.create!(email: 'facilitator@demo.com', password: '123123123', name: 'Facilitator')
end
