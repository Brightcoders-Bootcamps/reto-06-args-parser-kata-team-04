# frozen_string_literal: true

require_relative 'flag_behaviour'

# Parent class of any flag
class PortBehaviour < FlagBehaviour
  def initialize(argv)
    super
    @name = 'Port'
    @error_msg = 'Error, given value is not a integer'
    argv.include?('-p') ? identify_supposed_value('-p') : @value = 0
  end

  def identify_value
    return @value = 0 if flag?(@supposed_value) || @supposed_value.nil?

    @value = valid_flag_value? ? @supposed_value : @error_msg
  end

  def valid_flag_value?
    regex = %r{\A[-+]?\d+\z}
    !regex.match(@supposed_value).nil? && !flag?(@supposed_value)
  end
end
