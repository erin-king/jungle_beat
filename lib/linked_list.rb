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

  def to_string
    current_node = @head
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

  def find(position, size)
    count = 0
    if @head == nil
      return nil
    else
      if position == count
        self.to_string
        # @head = Node.new(data, @head)
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

    current_node = @head
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


end
