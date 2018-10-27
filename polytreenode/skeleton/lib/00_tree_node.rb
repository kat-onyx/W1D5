require 'byebug'
class PolyTreeNode
  
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end
  
  def parent=(parent)
    # byebug
    if parent.nil?
      @parent = parent # still need to assign @parent something
      return
    end
    
    if @parent.nil?
      @parent = parent
      @parent.children << self
    elsif !@parent.nil? && !parent.children.include?(self)
      @parent.children.delete(self)
      @parent = parent
      @parent.children << self
    end
    
    @parent = parent
  end
  
  def add_child(child_node)
    child_node.parent = self
  end
  
  def remove_child(child_node)
    raise "Error: child_node not a child" unless @children.include?(child_node)
    
    child_node.parent = nil
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    
    @children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    
    nil
  end
  
  def bfs(target_value)
    result = []
    result << self
    until result.empty?
      dequeued = result.shift
      if target_value == dequeued.value 
        return dequeued
      else
        dequeued.children.each { |child| result << child }
      end
    end
  end
  
end