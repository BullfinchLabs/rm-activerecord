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

desc 'Create a new migration. E.g. rake db:gen_migration name=<NameOfMigratioN>'
task 'db:gen_migration' do
  name = ENV['name']

  if !File.exists?("config/database.yml")
    puts "db:gen_migration: Error: config/database.yml not found. Please run db:init first."
    next
  end

  filename = "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_#{name.underscore}.rb"
  File.open(filename, "w+") do |fp|
    fp.write("class #{name} < ActiveRecord::Migration\n")
    fp.write("  def up\n  end\n\n")
    fp.write("  def down\n  end\n")
    fp.write("end\n")
  end
  puts "db:gen_migration: Created new migration file at db/migrate/#{filename}"
end

desc 'Run the migrations'
task 'db:migrate' do
  puts "db:migrate: Running migrations"
end

