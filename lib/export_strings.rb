require "export_strings/version"
require "export_strings/core"

module ExportStrings
  class Error < StandardError; end
  def self.execute(file_path)
    Core.execute File.read(file_path)
  end
end
