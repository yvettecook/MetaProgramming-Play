class Duck

  def method_missing(name)
    puts "This method hasn't really broken"
  end

end

duck = Duck.new
duck.quack
>> "This method hasn't really broken"
duck.kill
>> "This method hasn't really broken"


# Can add block

class Duck

  def method_missing(name, *args, &block)
    puts "This method hasn't really broken"
    block.call
  end

end

duck = Duck.new
duck.quack(2){ puts "quack" }

>> "This method hasn't really broken"
>> "quack"
#
