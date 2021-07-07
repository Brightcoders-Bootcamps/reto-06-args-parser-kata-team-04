# frozen_string_literal: true

require_relative 'flag_behaviour'

# Parent class of any flag
class StringListBehaviour < FlagBehaviour
  def initialize(argv)
    super
    @name = 'String List'
    @error_msg = 'Error, given value is not a valid String List'
    argv.include?('-g') ? identify_supposed_value('-g') : @value = []
  end

  def identify_value
    return @value = [] if flag?(@supposed_value) || @supposed_value.nil?

    list_type? == 's' ? valid_list : not_valid_list
  end

  def valid_list
    @value = @supposed_value.split(',')
  end

  def not_valid_list
    @value = @error_msg
  end
end
