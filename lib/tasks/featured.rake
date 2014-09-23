desc 'This task will update the featured suppliers.'
task :featured_suppliers => :environment do
  puts 'Updating featured suppliers...'
  FeaturedSupplier.update
  puts 'Done.'
end
