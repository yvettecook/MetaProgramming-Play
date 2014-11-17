class Student

  def initialize
    @badges = []
  end

  def award(badge)
    @badges << badge
    badge_method = "has_#{badge}?"
    self.class.send(:define_method, badge_method){ return true }
  end

  def meta_method(arg)
    self.class.send(:define_method, arg){ puts 'Hello, world'}
  end

  def method_missing(method_name)
    return false if method_name.to_s =~ /^has_.+?\?/
    puts "Chill, #{method_name} doesn't yet exist, but thats cool"
  end

end

student = Student.new
puts student.has_unixoid?
