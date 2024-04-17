# frozen_string_literal: true

class Node

  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList

  attr_reader :head

  def initialize(value)
    node = Node.new(value)
    @head = node
  end

  def append(value)
    tail.next_node = Node.new(value)
  end

  def tail
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    size = 0
    current_node = @head
    until current_node.nil?
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def at(index)
    current_node = @head
    index.times { current_node = current_node.next_node }
    current_node
  end

  def pop
    return nil if head.nil?

    previous_node = nil
    current_node = @head
    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    if previous_node
      previous_node.next_node = nil
    else
      @head = nil
    end
    current_node
  end

  def contains?(value)
    found = false
    current_node = @head
    until current_node.nil?
      found = true if current_node.value == value
      current_node = current_node.next_node
    end
    found
  end

  def find(value)
    index = nil
    count = 0
    current_node = @head
    until current_node.nil? || !index.nil?
      index = count if current_node.value == value
      current_node = current_node.next_node
      count += 1
    end
    index
  end

  def insert_at(value, index)
    if index.zero?
      prepend(value)
      return
    end
    node = at(index - 1)
    node.next_node = Node.new(value, node.next_node)
  end

  def remove_at(index)
    if index.zero?
      @head = @head.next_node
      return
    end
    at(index - 1).next_node = at(index).next_node
  end

  def to_s
    string = ''
    current_node = @head
    until current_node.nil?
      string += "#{current_node.value} -> "
      current_node = current_node.next_node
    end
    "#{string}nil"
  end
end


