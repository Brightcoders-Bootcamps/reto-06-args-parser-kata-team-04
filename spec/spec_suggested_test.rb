# frozen_string_literal: true

require_relative '../app/port_behaviour'
require_relative '../app/main'

RSpec.describe 'First Suggested Case' do
  let(:port) { PortBehaviour.new(["-p", "-8808"]) }
  it "Checks the result of a port flag schema" do
    expect(port.create_flag_schema.to_s).to eq("Port : -8808")
  end
end

RSpec.describe 'Second Suggested Case' do
  let(:main) { MainArgs.new(["-d", "-p", "-l"]) }
  it "Checks that the order of the arguments need not match the order given in the schema" do
    expect(main.test_flags_result).to eq("Logging : true Port : 0 Directory :  String List : [] ")
  end
end

RSpec.describe 'Third Suggested Case' do
  let(:main) { MainArgs.new(["-p", "-d", "-g"]) }
  it "Checks default values are correctly assigned if flags given in the schema are missing in the args given" do
    expect(main.test_flags_result).to eq("Logging : false Port : 0 Directory :  String List : [] ")
  end
end
