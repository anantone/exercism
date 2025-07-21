module TwoFer
  extend self

  def two_fer(name = 'you')
    'One for %<name>s, one for me.' % {name:}
  end
  
end
