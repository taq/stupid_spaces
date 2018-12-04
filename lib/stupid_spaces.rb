require "stupid_spaces/version"

module StupidSpaces
  def self.included(cls)
    cls.columns_hash
       .select { |_, col| col.type.match?(/string/) }
       .map    { |key, _| key }.each do |col|
      define_method("#{col}=") do |value|
        write_attribute(col, value.nil? ? nil : value.strip)
      end
    end
  end
end
