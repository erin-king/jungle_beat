require 'pry'

class JungleBeat

  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

  def append(data_string)
    split_data = data_string.split
    split_data.each do |data|
      @list.append(data)
    end
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r 100 #{beats}`
    beats
  end
end
