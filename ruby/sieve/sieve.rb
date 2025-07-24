class Sieve

  def initialize(number)
    @list = (2..number).to_a
  end

  def primes
    @list.each do |i|
      @list.each do |j|
        if j != i && j % i == 0
          @list.delete(j)
        end
      end
    end
    @list
  end

end
