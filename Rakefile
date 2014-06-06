require 'bundler'
Bundler.require

Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |f| require f }

require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/*/*_test.rb'
end

namespace :harvest do
	task :jems do
		# Mongoid.configure do |config|
  # 		config.connect_to 'guess-the-gem-dev'
		# end

		latest = Gems.latest
		latest.each do |gem_hash|
			dependencies = []
			gem_hash['dependencies'].keys.each do |key|
				gem_hash['dependencies'][key].each do |item|
					dependencies << item['name'] if item['name']
				end
			end

			jem_attr = {
				:name => gem_hash['name'],
				:version => gem_hash['version'],
				:downloads => gem_hash['version_downloads'],
				:platform => gem_hash['platform'],
				:authors => [gem_hash['authors']].flatten,
				:info => gem_hash['info'],
				:dependencies => dependencies
			}
			jem = Jem.new(jem_attr)
			jem.save! if jem.valid?
		end
	end
end