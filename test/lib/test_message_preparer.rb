require 'minitest/autorun'

require './lib/message_preparer'

class TestMessagePreparer < Minitest::Test
  def test_slack_names
    names = MessagePreparer.shuffled_names

    assert_includes names, 'Jake'
    assert_includes names, 'Mary'
    assert_includes names, 'Matt'
    assert_includes names, 'Dillon'
  end

  def test_pairs
    assert MessagePreparer.pairs.length == 2
    assert(MessagePreparer.pairs.all? { |pair| pair.length == 2 })
  end

  def test_prepare
    assert MessagePreparer.prepare =~ /🤝 Hashshake time/
    assert MessagePreparer.prepare =~ /Take time this week/
    assert MessagePreparer.prepare =~ /- \w+ meets with \w+\n- \w+ meets with \w+/
  end
end
