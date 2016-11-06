unless Project.any?
  Project.create!(facilitator_id: 1, name: 'Test Project', location: 'Test Location', start_on: Date.current)
end
