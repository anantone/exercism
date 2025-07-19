class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(b1_size, b2_size, goal, start_b)
    @moves = 0
    @b1_size = b1_size
    @b2_size = b2_size
    @goal = goal
    @start_b = start_b
    empty_state = [0, 0]
    full_state = [b1_size, b2_size]
    forbiden_state = start_b == 'one' ? [0, b2_size]: [b1_size, 0]
    @states = [empty_state, forbiden_state]

    # sometime we want to be in the state "full" to achieve goal in 2 move
    if !full_state.include?(@goal)
      @states << full_state
    end

    compute
  end

  private
  def compute
    first_move = @start_b == 'one' ? [@b1_size, 0]: [0, @b2_size]
    @states << first_move
    @moves += 1

    while !@states.last.include?(@goal)
      @states << next_move
      @moves += 1
    end

    b1, b2 = @states.last
    @goal_bucket = b1 == @goal ? 'one' : 'two'
    @other_bucket = b1 == @goal ? b2 : b1
  end

  def next_move
    b1, b2 = @states.last
    next_possible_states.find{|state| !@states.include?(state)}
  end

  def next_possible_states
    b1, b2 = @states.last
    [
      [@b1_size, b2], # fill b1
      [b1, @b2_size], # fill b2
      [0, b2], # empty b1
      [b1, 0], # empty b2
      [[b1-(@b2_size-b2), 0].max, [b1+b2,@b2_size].min], # pour b1 in b2
      [[b1+b2,@b1_size].min, [b2-(@b1_size-b1), 0].max] # pour b2 in b1
    ]
  end
end