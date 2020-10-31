require 'fileutils'
require 'pathname'

timestamp = Time.now.strftime('%m-%d_%H-%M-%S')

project_dir = Pathname.new(Dir.pwd)
idea_conf_dir = project_dir + '.idea'

raise "Unable to find #{idea_conf_dir}" unless Dir.exist?(idea_conf_dir)

libraries_dir = idea_conf_dir + 'libraries'
puts "Creating libraries directory: #{libraries_dir}"
FileUtils.mkdir_p libraries_dir

paths = Bundler.load.specs.to_a.map(&:full_gem_path).map do |full_gem_path|
  Pathname.new(full_gem_path).relative_path_from(project_dir)
end

# Do not add gem files outside of
paths = paths.reject do |path|
  exclude = (path.to_s == '.' || path.to_s.start_with?('..'))
  puts "Excluding gem #{path}" if exclude
  exclude
end

paths = paths.map do |path|
  %(<root url="file://$PROJECT_DIR$/#{path}" />)
end

gems_lib_file = libraries_dir + 'gems.xml'
puts "Creating #{gems_lib_file} with #{paths.size} gems:"

library_file_xml = <<~eos
  <component name="libraryTable">
    <library name="gems">
      <CLASSES />
      <JAVADOC />
      <SOURCES>
  #{paths.join("\n")}
      </SOURCES>
    </library>
  </component>
eos

puts library_file_xml

if File.exists?(gems_lib_file)
  FileUtils.copy(gems_lib_file, "#{gems_lib_file}.#{timestamp}")
end

File.open(gems_lib_file, 'w') { |file| file.write(library_file_xml) }

iml_files = Dir.glob(idea_conf_dir + '*.iml')

raise "Expected singe iml file, found #{iml_files}" if iml_files.size != 1

iml_file = idea_conf_dir + iml_files.first

file = File.readlines(iml_file)
existing_line = file.find { |line| line =~ /\s+<orderEntry\s+type="library"\s+name="gems"/ }
if existing_line.nil?
  puts "Adding gems lib to #{iml_file}"

  FileUtils.copy(iml_file, "#{iml_file}.#{timestamp}")

  index = file.index { |line| line =~ /\s+<orderEntry\s+type="library"/ }

  raise 'Unable to find library order entry for gems lib insertion' if index.nil? || index.zero?

  file.insert(index-1, %(<orderEntry type="library" name="gems" level="project" />\n))
  File.write(iml_file, file.join)
else
  puts "Skipping adding gems lib to #{iml_file}, line already added #{existing_line}"
end
