module TwoFer

  SHARING = 'One for %<name>s, one for me.'

  def self.two_fer(name = 'you')
    SHARING % {name:}
  end

end
