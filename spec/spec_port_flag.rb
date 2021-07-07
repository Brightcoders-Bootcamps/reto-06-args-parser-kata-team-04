# frozen_string_literal: true

require_relative '../app/port_behaviour'

RSpec.describe 'Port Flag Behaviour' do
  it "Checks the result of a port flag schema" do
    port = PortBehaviour.new(["-p", "8808"])
    expect(port.create_flag_schema.to_s).to eq("Port : 8808")
  end
  
  it "Checks the result of a port flag schema when there is an error" do
    port = PortBehaviour.new(["-p", "8808p"])
    expect(port.create_flag_schema.to_s).to eq("Port : Error, given value is not a integer")
  end
  
  it "Checks the result of a port flag schema when has no values associated" do
    port = PortBehaviour.new(["-p", "-l"])
    expect(port.create_flag_schema.to_s).to eq("Port : 0")
    port = PortBehaviour.new(["-p", "-d"])
    expect(port.create_flag_schema.to_s).to eq("Port : 0")
    port = PortBehaviour.new(["-p"])
    expect(port.create_flag_schema.to_s).to eq("Port : 0")
  end
end