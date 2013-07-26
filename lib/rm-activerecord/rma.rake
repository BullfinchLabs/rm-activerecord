desc 'Initializes RMActiveRecord by creating an empty db and config file.'
task 'db:init' do
  if File.exists?("config/database.yml")
    puts "db:init: Error: config/database.yml already exists"
    return
  end

  mkdir_p("config/") if !File.exists?("config/")
  mkdir_p("db/") if !File.exists?("db/")
  mkdir_p("db/migrate/") if !File.exists?("db/migrate/")

  puts "db:init: Creating config/database.yml"
  File.open("config/database.yml","w+") do |fp|
    fp.write("database: db.sqlite3\n")
  end

  puts "db:init: Creating empty SQLite3 database"
  cp("db.sqlite3",File.join("db","db.sqlite3"), :verbose => true)
end
