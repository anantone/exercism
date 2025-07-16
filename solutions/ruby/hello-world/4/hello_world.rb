HelloWorld = 'Hello, %s%c'
public
def hello(vocative = 'World', tone = '!')
    self % [vocative, tone]
end
