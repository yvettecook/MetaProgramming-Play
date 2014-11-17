class Student

  def self.attr_accessor?(attr)
    read_method = "#{attr}?"
    write_method = "#{attr}="
    self.send(:define_method, read_method) { eval ("return @#{attr}") }
    self.send(:define_method, write_method) { |value| eval ("@#{attr} = value") }
  end

  attr_accessor? :awesome

  def initialize
    @badges = []
    @awesome = true
  end

  def award(badge)
    @badges << badge
    badge_method = "has_#{badge}?"
    self.class.send(:define_method, badge_method){ return true }
  end


  def method_missing(method_name, *args)
    return false if method_name.to_s =~ /^has_.+?\?/
    puts "Chill, #{method_name} doesn't yet exist, but thats cool"
  end

end
