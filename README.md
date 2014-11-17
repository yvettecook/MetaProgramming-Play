## Week 10: Makers's Academy
### *Playing around with metaprogramming in Ruby*

#### Challenge:

- [x] Use `method_missing` to redefine how an object reacts when asked `has_unknown_attribute`.
- [x] Use `define_method` to create a boolean version of Ruby's inbuilt `attr_accessor` method.

#### Code Snippets:

attr_accessor method using `define_method`

```ruby
def self.attr_accessor?(attr)
  read_method = "#{attr}?"
  write_method = "#{attr}="
  self.send(:define_method, read_method) { instance_variable_get("@#{attr}") }
  self.send(:define_method, write_method) { |value| instance_variable_set("@#{attr}", value) }
end
```

#### Learning

Whilst these are only very simple examples, metaprogramming isn't quite as terrifying as I first thought.
