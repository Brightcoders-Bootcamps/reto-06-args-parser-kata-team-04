# frozen_string_literal: true

# Schema class
Schema = Struct.new(:name, :value) do
  def to_s
    "#{name} : #{value}"
  end
end
