class Attendee
  def initialize(height)
    @height = height
    @pass_id = nil
  end

  def height
    @height 
  end

  def pass_id
    @pass_id
  end

  def issue_pass!(pass_id)
    @pass_id = 1
  end

  def revoke_pass!
    @pass_id = false
  end
end
