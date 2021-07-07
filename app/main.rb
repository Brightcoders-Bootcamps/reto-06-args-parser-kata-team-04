# frozen_string_literal: true

require_relative 'flag_behaviour'
require_relative 'logging_behaviour'
require_relative 'port_behaviour'
require_relative 'directory_behaviour'
require_relative 'string_list_behaviour'

# Schema class
class MainArgs < FlagBehaviour
  def initialize(argv)
    super
    @flags_schemas = []
    save_flags_schema
  end

  def save_flags_schema
    @flags.each do |flag|
      @flags_schemas.push(obtain_flag_schema(flag))
    end
  end

  def show_flags_result
    @flags_schemas.each { |flag| puts flag.create_flag_schema.to_s }
  end

  def test_flags_result(result = '')
    @flags_schemas.each { |flag| result += flag.create_flag_schema.to_s + ' ' }
    result
  end

  def flag_appears?(flag_name)
    @arguments.include?(flag_name)
  end

  def obtain_flag_schema(flag_name)
    return LoggingBehaviour.new(@arguments) if flag_name == '-l'
    return PortBehaviour.new(@arguments) if flag_name == '-p'
    return DirectoryBehaviour.new(@arguments) if flag_name == '-d'
    return StringListBehaviour.new(@arguments) if flag_name == '-g'
  end
end

MainArgs.new(ARGV).show_flags_result
