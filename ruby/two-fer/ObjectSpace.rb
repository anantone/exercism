module TwoFer
  extend self
  def two_fer(name = 'you')
    'One for %<name>s, one for me.' % {name:}
  end
end
# Use ObjectSpace methods to find out how many objects have `two_fer` available
count = 0
ObjectSpace.each_object do |object|
  count += 1 if object.respond_to?(:two_fer)
end

puts 'Number of objects that can call two_fer: %<count>i' % {count:}
