require 'forwardable'
class Catalog 
  extend Forwardable
  def initialize
    @items = []
  end
  def_delegators :@items, :size, :<<, :[] 
end
