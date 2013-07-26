desc 'Initializes RMActiveRecord by creating an empty db and config file.'
task 'db:init' do
  dir = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  dir = "#{dir}/rm-activerecord/"

  if File.exists?("config/database.yml")
    puts "db:init: Error: config/database.yml already exists"
    next
  end

  mkdir_p("config/") if !File.exists?("config/")
  mkdir_p("db/") if !File.exists?("db/")
  mkdir_p("db/migrate/") if !File.exists?("db/migrate/")

  puts "db:init: Creating config/database.yml"
  cp("#{dir}/database.yml",File.join("config","database.yml"), :verbose => false)

  puts "db:init: Creating empty SQLite3 database"
  cp("#{dir}/db.sqlite3",File.join("db","db.sqlite3"), :verbose => false)
end
