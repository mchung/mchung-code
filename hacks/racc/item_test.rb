require 'test/unit'
require 'item_parser.tab'
require 'catalog'
require 'item'

class ItemTest < Test::Unit::TestCase

  def test_read_two
    parser = ItemParser.new
    parser.parse "item camera\nitem laser\n"
    assert_equal 2, parser.result.size
    assert_equal 'camera', parser.result[0].name
    assert_equal 'laser', parser.result[1].name
  end

  def test_read_bad
    parser = ItemParser.new
    parser.parse "xitem camera"
    fail
  rescue #expected
  end

end
