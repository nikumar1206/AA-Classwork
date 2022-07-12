class PolyTreeNode
  attr_reader :parent, :children, :value
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent)
    return @parent=nil if parent == nil
    @parent.children.delete(self) if @parent != nil
    @parent = parent
    @parent.children.push(self)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Node is not a child" if child_node.parent == nil
    child_node.parent = nil 
  end

  def dfs(target_value)
    if value == target_value
      return self
    else 
      children.each do |child|
        check = child.dfs(target_value)
        return check if check != nil 
      end
    end
    return nil
  end

  def bfs(target_value)
    queue = []
    queue << self
    until queue.empty?
      check = queue.shift
      if check.value == target_value
        return check
      else 
        check.children.each { |child| queue << child}
      end
    end
    return nil
  end
end