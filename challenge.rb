# frozen_string_literal: true

# SMS can only be a maximum of 160 characters.
# If the user wants to send a message bigger than that, we need to break it up.
# We want a multi-part message to have this suffix added to each message:
# " - Part X of Y"
# write a message that cuts up any string into chunks of 160 characters length exactly includin the suffix
require './sms_utils'

# You need to fix this method, currently it will crash with > 160 char messages.
def send_sms_message(text, to, from)
  packages = SmsUtils.new.split_into_chunks(text)

  packages.each do |text_package|
    deliver_message_via_carrier(text_package, to, from)
  end
end

# This method actually sends the message via a SMS carrier
# This method works, __you don't change it__,
def deliver_message_via_carrier(text, to, from)
  SMS_CARRIER.deliver_message(text, to, from)
end
