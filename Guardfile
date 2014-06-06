# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :minitest do
  watch(%r{^test/(.*)\/?test_(.*)\.rb$}) 													{ 'test' }
  watch(%r{^test/models/(.*/)?([^/]+)\.rb$}) 			{ 'test' }
  watch(%r{^test/controllers/(.*/)?([^/]+)\.rb$}) { 'test' }
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     													{ 'test' }
  watch(%r{^controllers/(.*/)?([^/]+)\.rb$})     { 'test' }
  watch(%r{^models/(.*/)?([^/]+)\.rb$})     			{ 'test' }
  watch(%r{^test/test_helper\.rb$})      													{ 'test' }
end
