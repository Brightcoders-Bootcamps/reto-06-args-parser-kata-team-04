# frozen_string_literal: true

require_relative 'schema'

# Parent class of any flag
class FlagBehaviour
  def initialize(argv)
    @arguments = argv
    @flags = ['-l', '-p', '-d', '-g']
  end

  def identify_supposed_value(flag_name)
    position = @arguments.index(flag_name)
    @supposed_value = @arguments[position + 1]
  end

  def identify_value; end

  def create_flag_schema
    identify_value
    Schema.new(@name, @value)
  end

  def flag?(argument)
    @flags.include?(argument)
  end

  def list_type?
    int_regex = %r{^(0|-*[1-9]+[0-9]*)+(?:, ?(0|-*[1-9]+[0-9]*)+)*$}
    string_regex = %r{^[^,]+(?:, ?[^,]+)*$}
    return 'i' if !int_regex.match(@supposed_value).nil? && !flag?(@supposed_value)
    return 's' if !string_regex.match(@supposed_value).nil? && !flag?(@supposed_value)
  end
end
