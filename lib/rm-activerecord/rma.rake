desc 'Sets up RMActiveRecord by creating an empty db and config if not present'
task 'db:setup' do
  if !File.exists?("config/database.yml")
    directory "config/"

    File.open("config/database.yml","w+") do |fp|
      fp.write("database: db.sqlite3\n")
    end
  end
  
  if !File.exists?("db/") || !File.exists?("db/migrations/")
    directory "db/"
    directory "db/migrations/"
  end
end
