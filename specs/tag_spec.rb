require( 'minitest/autorun' )
require_relative('../models/tag')

class TestTag < MiniTest::Test


  def setup
    params = {
      'name'=> 'groceries',
      'id' => 1
    }

    @tag = Tag.new(params)
  end

  def test_tag_has_id
    assert_equal(1, @tag.id)
  end

  def test_tag_has_name
    assert_equal('groceries', @tag.name)
  end
end