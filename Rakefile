require 'rubygems'
require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |s| 
	s.spec_files = Dir.glob('spec/**/*_spec.rb')
	s.spec_opts << '--color'
	s.rcov = true
end
