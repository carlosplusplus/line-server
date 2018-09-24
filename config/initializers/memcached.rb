# If the FILE env var is set, this initializer is being triggered when running
# the rails s(erver) on app startup.
if ENV['FILE']
  # On initialization, create test files at varying sizes.
  # Module code will only create these if they don't exist.
  puts
  puts 'Creating test files for line server.'

  t = Time.now

  FileCreator.generate(10)       # ~ 450  B
  FileCreator.generate(1000)     # ~  50 KB
  FileCreator.generate(1000000)  # ~  50 MB

  puts "Files created in: #{Time.now - t}s (low time indicates they already exist)"
  puts

  # Check to make sure file passed into application exists.
  file = Rails.root.join('tmp', ENV['FILE'])
  raise 'File passed in does not exist in tmp folder!' unless File.file?(file)

  # Write file lines into memcached.
  puts 'Writing text file into cache.'

  t = Time.now

  File.open(file, 'r').each_with_index do |l, i|
    Rails.cache.write(i+1, l)
  end

  puts "Cache populated in: #{Time.now - t}s"
  puts
end
