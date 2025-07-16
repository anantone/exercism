HelloWorld = '%s, %s%c'
public
def hello(greeting = 'Hello', vocative = 'World', tone = '!')
    self % [greeting, vocative, tone]
end
