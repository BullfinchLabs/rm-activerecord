desc 'Sets up RMActiveRecord by creating an empty db and config if not present'
task 'db:setup' do
  if !File.exists?("config/database.yml")
    File.open("config/database.yml","w+") do |fp|
      fp.write("database: db.sqlite3\n")
    end
  end
end