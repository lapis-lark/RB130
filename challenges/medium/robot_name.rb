class Robot
  attr_reader :name
  @@robot_names = []

  def initialize
    @name = generate_valid_name
  end

  def reset
    @@robot_names.delete(name)
    self.name = generate_valid_name
  end

  def self.register
    @@robot_names
  end

  private
  attr_writer :name

  def generate_valid_name
    temp = ''
    2.times { temp << ('A'..'Z').to_a.sample}
    3.times { temp << rand(0..9).to_s}
    if @@robot_names.include?(temp)
      generate_valid_name
    else
      @@robot_names << temp
      temp
    end
  end
end

# p Robot.new.name
# p Robot.new.name
# p Robot.new.name
# p Robot.new.name
# p Robot.register