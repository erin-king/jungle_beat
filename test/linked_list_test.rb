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

  def test_it_can_find_and_return_node_subsets_data_as_string
    # assert_equal "", @list.find(0, 1)
    @list.append("plop")
    # assert_equal "plop", @list.find(0, 1)
    @list.append("ding")
    # assert_equal "plop ding", @list.find(0, 2)
    # assert_equal "plop", @list.find(0, 1)
    @list.append("woo")
    @list.append("poo")
    # assert_equal "woo", @list.find(2, 1)
    assert_equal "woo poo", @list.find(2, 2)
  end

  def test_it_can_find_start_node
    assert_equal nil, @list.find_sublist_start(2, @list.head)
    @list.append("plop")
    assert_equal "plop", @list.find_sublist_start(0, @list.head).data
    @list.append("ding")
    assert_equal "plop", @list.find_sublist_start(0, @list.head).data
    assert_equal "ding", @list.find_sublist_start(1, @list.head).data
    @list.append("woo")
    @list.append("poo")
    @list.append("dong")
    assert_equal "woo", @list.find_sublist_start(2, @list.head).data
    assert_equal "dong", @list.find_sublist_start(4, @list.head).data
  end

  def test_it_can_find_end_node
    @list.append("plop")
    @list.append("ding")
    @list.append("woo")
    @list.append("poo")
    @list.append("dong")
    assert_equal "plop ding", @list.to_string(@list.find_sublist_end(2, @list.head))
  end

  def test_it_can_find_included_data
    @list.append("ding")
    @list.append("woo")
    assert @list.includes?("ding")
    assert @list.includes?("woo")
    refute @list.includes?("dong")
  end

  def test_it_can_remove_the_last_node
    @list.append("ding")
    @list.append("woo")
    @list.append("dong")
    assert_equal "ding woo dong", @list.to_string
    @list.pop
    assert_equal "ding woo", @list.to_string
  end
end
