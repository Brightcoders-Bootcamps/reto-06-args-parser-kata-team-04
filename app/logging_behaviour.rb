# frozen_string_literal: true

require_relative 'flag_behaviour'
require_relative 'schema'

# Parent class of any flag
class LoggingBehaviour < FlagBehaviour
  def initialize(argv)
    @name = 'Logging'
    @value = argv.include?('-l')
  end
end
