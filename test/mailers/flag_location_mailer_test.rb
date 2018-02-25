require 'test_helper'

class FlagLocationMailerTest < ActionMailer::TestCase
  test "flag_location" do
    mail = FlagLocationMailer.flag_location
    assert_equal "Flag location", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
