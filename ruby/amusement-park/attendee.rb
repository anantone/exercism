class Attendee

  private

  attr_writer :height
  
  def initialize(height)
      self.height = height
  end

  public

  attr_reader :height
  attr_accessor :pass_id

  def issue_pass!(pass_id)
      self.pass_id = pass_id
  end

  def revoke_pass!
      self.pass_id = false
  end
end
