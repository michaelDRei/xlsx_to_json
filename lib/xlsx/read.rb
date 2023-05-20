module Xlsx
  class Read
    require 'rubyXL'
    require 'logger'

    ALLOWED_FILE_MESSAGE = "allowed file type: .xlsx".freeze
    FILE_NOT_FOUND_MESSAGE = "file_not_found".freeze

    def initialize(filepath)
      @filepath = filepath
      @logger = Logger.new(STDOUT)
    end

    def values
      return content_file.drop(first_line_cell_count)
    end

    def keys
      return content_file.take(first_line_cell_count)
    end

    def filename
      return file_not_found_error unless File.exist?(filepath)

      File.basename(filepath)
    end

    private

    def xlsx_path
      @xlsx_path ||= RubyXL::Parser.parse(filepath)
    end

    def content_file
      return file_not_found_error unless File.exist?(filepath)
      return extension_error unless extname_xlsx?

      worksheet = xlsx_path[0]
      cells = []

      worksheet.each do |row|
        row && row.cells.each do |cell|
          cells.push(cell.value.to_s)
        end
      end

      cells = cells.reject { |item| item.strip.empty? }

      return cells
    rescue
      nil
    end

    def first_line_cell_count
      worksheet = xlsx_path[0]

      line = worksheet.sheet_data[0]

      return line.size
    end

    def extname_xlsx?
      File.extname(filename) == ".xlsx"
    end

    def file_not_found_error
      @logger.error(FILE_NOT_FOUND_MESSAGE)
    end

    def extension_error
      @logger.error(ALLOWED_FILE_MESSAGE)
    end

    attr_reader :filepath
  end
end
