require 'test_helper'

class HhMailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = HhMailer.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "favorite" do
    mail = HhMailer.favorite
    assert_equal "Favorite", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "newsletter" do
    mail = HhMailer.newsletter
    assert_equal "Newsletter", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
