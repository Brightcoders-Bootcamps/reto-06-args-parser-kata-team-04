# frozen_string_literal: true

require_relative 'flag_behaviour'

# Parent class of any flag
class DirectoryBehaviour < FlagBehaviour
  def initialize(argv)
    super
    @name = 'Directory'
    @error_msg = 'Error, given value is not a valid path'
    argv.include?('-d') ? identify_supposed_value('-d') : @value = ''
  end

  def identify_value
    return @value = '' if flag?(@supposed_value) || @supposed_value.nil?
    return @value = @supposed_value if valid_flag_value?
    return valid_list if list_type? == 'i'

    !%r{\d}.match(@supposed_value).nil? && !@supposed_value.include?('/') ? not_valid_list : @value = @error_msg
  end

  def valid_flag_value?
    regex = %r{^(\/[\w^ ]+)+\/?$}
    !regex.match(@supposed_value).nil? && !flag?(@supposed_value)
  end

  def valid_list
    @name = 'Integer List'
    @value = @supposed_value.split(',')
  end

  def not_valid_list
    @name = 'Integer List'
    @value = 'Error, given value is not a valid Integer List'
  end
end
