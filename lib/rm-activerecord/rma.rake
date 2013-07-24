desc 'Sets up RMActiveRecord by creating an empty db and config if not present'
task 'db:setup' do
  mkdir_p("config/") if !File.exists?("config/")
  mkdir_p("db/") if !File.exists?("db/")
  mkdir_p("db/migrations/") if !File.exists?("db/migrations/")

  if !File.exists?("config/database.yml")
    File.open("config/database.yml","w+") do |fp|
      fp.write("database: db.sqlite3\n")
    end
  end
end
