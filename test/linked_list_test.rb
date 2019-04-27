require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"
require "./lib/linked_list"

class LinkedListTest < Minitest::Test
  def setup
    @list = LinkedList.new
  end

  def test_it_exists
    assert_instance_of LinkedList, @list
  end

  def test_it_can_append_sounds
    assert_equal "doop", @list.append("doop")
  end

  def test_it_creates_a_new_instance_of_node
    @list.append("doop")
    assert_instance_of Node, @list.head
  end

  def test_it_can_count_nodes_in_the_list
    @list.append("doop")
    assert_equal 1, @list.count
    @list.append("ding")
    assert_equal 2, @list.count
  end

  def test_it_can_list_data_as_string
    assert_equal "", @list.to_string
    @list.append("plop")
    assert_equal "plop", @list.to_string
    @list.append("ding")
    assert_equal "plop ding", @list.to_string
    @list.append("dong")
    assert_equal "plop ding dong", @list.to_string
  end

  def test_it_can_prepend_a_node_to_the_list
    @list.append("plop")
    @list.append("ding")
    assert_equal "plop ding", @list.to_string
    @list.prepend("dong")
    assert_equal "dong plop ding", @list.to_string
    assert_equal 3, @list.count
  end

  def test_it_can_insert_a_node_into_the_list_by_position
    @list.append("plop")
    @list.append("ding")
    assert_equal "plop ding", @list.to_string
    @list.insert(1, "woo")
    assert_equal "plop woo ding", @list.to_string
    @list.insert(3, "doop")
    assert_equal "plop woo ding doop", @list.to_string
    @list.insert(0, "poop")
    assert_equal "poop plop woo ding doop", @list.to_string
  end
end
