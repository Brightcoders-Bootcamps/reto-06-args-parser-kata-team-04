# frozen_string_literal: true

require_relative 'schema'

# Parent class of any flag
class FlagBehaviour
  def initialize(flag_exists, argv)
    @arguments = argv
    @flags = ['-l', '-p', '-d']
    @value = flag_exists
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
end