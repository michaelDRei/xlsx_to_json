module Json
  class Generate
    require 'logger'
    require 'json'
    require_relative '../xlsx/read.rb'

    def initialize(file_path)
      @file_path = file_path
      @logger = Logger.new(STDOUT)
    end

    def call
      object
    end

    private

    def object
      objects = {}
      values.each_slice(keys.length) do |slice|
        object_key = "#{filename}_#{objects.length + 1}"
        object = keys.zip(slice).to_h
        objects[object_key.to_sym] = object
      end

      puts JSON.pretty_generate(objects)
    end

    def xlsx_content
      @xlsx_content ||= Xlsx::Read.new(file_path)
    end

    def filename
      xlsx_content.filename.split(".").first
    end

    def keys
      xlsx_content.keys
    end

    def values
      xlsx_content.values
    end

    attr_reader :file_path
  end
end
