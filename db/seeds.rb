seed_files = %w(admins facilitators projects)

seed_files.each do |seed|
  seed_path = Rails.root.join('db', 'seeds', "#{seed}.rb")
  if File.file?(seed_path)
    puts "seeding #{seed.humanize} ..."
    require seed_path
  end
end

puts 'seeding done!'
