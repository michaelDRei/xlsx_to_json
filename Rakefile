require "rake"
require "bundler"
require_relative "lib/json/generate.rb"
require_relative "lib/xlsx/read.rb"

namespace :generate do
  desc "processes XLSX file and generates JSON object"
  task :json, [:file_path] do |t, args|
    object = Json::Generate.new(args[:file_path])
    object.call
  end
end

namespace :xlsx do
  desc "list extracted keys from .xlsx file"
  task :keys, [:file_path] do |t, args|
    read = Xlsx::Read.new(args[:file_path])

    puts read.keys
  end

  desc "list values extracted from .xlsx file"
  task :object_values, [:file_path] do |t, args|
    read = Xlsx::Read.new(args[:file_path])

    puts read.values
  end
end
