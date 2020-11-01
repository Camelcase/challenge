# frozen_string_literal: true

require './sms_utils'
describe SmsUtils do
  it 'splits text into chunks' do
    utils = SmsUtils.new
    text = utils.generate_code(140)

    expect(utils.split_into_chunks(text).size).to eql(1)
    # suffix default is " - Part X of Y", length of that is 14 so at 20 blocklength we need 33
    expect(utils.split_into_chunks(text, 20).size).to eql(33)
  end
end
