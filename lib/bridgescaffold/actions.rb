module Bridgescaffold
  module Actions

    def replace_in_file(relative_path, find, replace)
      path = File.join(destination_root, relative_path)
      contents = IO.read(path)
      unless contents.gsub!(find, replace)
        raise "#{find.inspect} not found in #{relative_path}"
      end
      File.open(path, "w") { |file| file.write(contents) }
    end

    def add_def_in_file(relative_path, def_method)
      replace_in_file(relative_path, /end\s*private/, def_method)
    end

  end
end