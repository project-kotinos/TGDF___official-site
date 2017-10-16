namespace :admin do
  desc 'Create a new admin user'
  task create: :environment do
    print 'Email: '
    email = STDIN.gets.chomp
    print 'Password: '
    password = STDIN.getpass

    begin
      AdminUser.create!(email: email, password: password)
      puts "Create #{email} success!"
    rescue ActiveRecord::RecordInvalid => e
      puts ''
      puts 'Create admin failed!'
      puts 'Reasons:'
      e.record.errors.messages.each do |field, messages|
        puts "\t#{field.to_s.capitalize}"
        messages.each { |message| puts "\t\t* #{message}" }
      end
    end
  end
end
