require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    # mail = OrderMailer.received orders(:one)
    # assert_equal "Received", mail.subject
    # assert_equal ["to@example.org"], mail.to
    # assert_equal ["from@example.com"], mail.from
    # assert_match "Hi", mail.body.encoded
  end

  test "shipped" do
    # mail = OrderMailer.shipped orders(:one)
    # assert_equal "Shipped", mail.subject
    # assert_equal ["to@example.org"], mail.to
    # assert_equal ["from@example.com"], mail.from
    # assert_match "Hi", mail.body.encoded
  end

end
