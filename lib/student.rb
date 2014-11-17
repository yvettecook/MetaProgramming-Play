class Student

  def self.attr_accessor?(attr)
    read_method = "#{attr}?"
    write_method = "#{attr}="
    self.send(:define_method, read_method) { instance_variable_get("@#{attr}") }
    self.send(:define_method, write_method) { |value| instance_variable_set("@#{attr}", value) }
  end

  attr_accessor? :awesome

  def initialize
    @badges = []
    @awesome = true
  end

  def award(badge)
    @badges << badge
    badge_method = "has_#{badge}?"
    self.class.send(:define_method, badge_method){ true if @badges.include?(badge) }
  end


  def method_missing(method_name)
    return false if method_name.to_s =~ /^has_.+?\?/
    super
  end

end
