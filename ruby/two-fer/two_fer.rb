module TwoFer
<<<<<<< HEAD

  SHARING = 'One for %<name>s, one for me.'

  def self.two_fer(name = 'you')
    SHARING % {name:}
  end

end
=======
  private
  def self.two_fer(name = 'you')
    'One for %s, one for me.' % name
  end
end
  
>>>>>>> 369cfdebf0a32100c89298983a6ee1b713b0db46
