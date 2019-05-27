require "export_strings/version"

module ExportStrings
  class Error < StandardError; end
  def self.execute(file_path)
    Core.execute File.read(file_path)
  end
end
