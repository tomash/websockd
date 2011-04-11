require 'rake/clean'
CLEAN.include('*.o')
CLOBBER.include('test-server')

desc "Default: Build the test executable"
task :default => [:build]

desc "Build the program"
task :build do
  sh "/opt/d2/usr/local/bin/gdc -o test-server main.d -I lib/ -L/usr/local/lib"
end
