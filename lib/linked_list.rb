require 'pry'

class LinkedList

  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
    end
    data
  end

  def prepend(data)
    if @head == nil
      @head = Node.new(data)
    else
      @head = Node.new(data, @head)
    end
  end

  def insert(position, data)
    count = 0
    if @head == nil
      @head = Node.new(data)
    else
      if position == count
        @head = Node.new(data, @head)
      end
      count += 1
      current_node = @head
      if position == count
        current_node.next_node = Node.new(data, current_node.next_node)
      end
      while current_node.next_node != nil
        count += 1
        current_node = current_node.next_node
        if position == count
          current_node.next_node = Node.new(data, current_node.next_node)
        end
      end
    end
  end

  def count
    current_node = @head
    count = 1
    if current_node == nil
      count = 0
    else
      while current_node && current_node.next_node
        count += 1
        current_node = current_node.next_node
      end
    end
    count
  end

  def to_string(start_node = nil)
    if start_node == nil
      current_node = @head
    else
      current_node = start_node
    end
    data_array = []
    if current_node
      data_array << current_node.data
      until current_node.next_node == nil
        current_node = current_node.next_node
        data_array << current_node.data
      end
    end
    data_array.join(" ")
  end

  def find_sublist_start(position, current_node)
    if current_node == nil
      return nil
    end
    count = 0
    if current_node.next_node == nil && position == 0
      return current_node
    elsif position == 1
      return current_node.next_node
    end
    until current_node.next_node == nil
      if count == position
        return current_node
      end
      count += 1
      current_node = current_node.next_node
    end
    current_node
  end

  def find_sublist_end(size, current_node)
    if current_node == nil
      return nil
    end
    start_node = current_node
    count = 1
    if current_node.next_node == nil && size == 1
      return start_node
    end
    until current_node.next_node == nil
      if count == size
        current_node.next_node = nil
        return start_node
      end
      count += 1
      current_node = current_node.next_node
    end
    start_node
  end

  def find(position, size)
    current_node = find_sublist_start(position, @head)
    sub_list = find_sublist_end(size, current_node)
    to_string(sub_list)
  end

  def includes?(data)
    current_node = @head
    data_array = []
    if current_node
      data_array << current_node.data
      until current_node.next_node == nil
        current_node = current_node.next_node
        data_array << current_node.data
      end
    end
    data_array.include?(data)
  end

  def pop
    current_node = @head
    while current_node.next_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = nil
    current_node.data
  end

end
