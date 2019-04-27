require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"
require "./lib/linked_list"
require "./lib/jungle_beat"

class JungleBeatTest < Minitest::Test

  def setup
    @list = LinkedList.new
    @jb = JungleBeat.new
  end

  def test_it_exists
    assert_instance_of JungleBeat, @jb
  end

  def test_it_has_a_list_that_has_a_head_of_nil
    assert_nil @jb.list.head
  end

  def test_it_can_append_data
    @jb.append("deep doo ditt")

    assert_equal "deep", @jb.list.head.data
    assert_equal "doo", @jb.list.head.next_node.data

    @jb.append("woo hoo shu")

    assert_equal 6, @jb.count
  end

  def test_it_can_play_beats
    @jb.append("deep doo ditt woo hoo shu")
    assert_equal "deep doo ditt woo hoo shu", @jb.play
  end
end
