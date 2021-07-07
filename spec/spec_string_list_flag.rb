# frozen_string_literal: true

require_relative '../app/string_list_behaviour'

RSpec.describe 'String List Flag with arguments' do
  let(:string_list) { StringListBehaviour.new(["-g", "this,is,a,list"]) }
  it "Checks the result of a String List flag" do
    expect(string_list.create_flag_schema.to_s).to eq('String List : ["this", "is", "a", "list"]')
  end
end

RSpec.describe 'String List Flag with no arguments' do
  let(:string_list) { StringListBehaviour.new(["-g"]) }
  it "Checks the result of a String List flag with no arguments" do
    expect(string_list.create_flag_schema.to_s).to eq('String List : []')
  end
end