class Sugoroku

  def initialize(cells)
    @map = cells
    reset!
  end

  def move(d)
    @move_count += 1
    @position += d
    @map[@position]
  end

  def goal?
    (@position + 1) == @map.size
  end

  def infinite_chain?
    @move_count > @map.size * 2
  end

  def reset!
    @position   = 0
    @move_count = 0
  end

  def info
    p(
      map: @map,
      position: @position
    )
  end
end

gets
stage = Sugoroku.new(gets.split.map(&:to_i))

gets
ARGF.each do |op|
  stage.reset!
  next_op = op.to_i
  while (next_op = stage.move(next_op)) || false.tap{puts "No"}
    if stage.goal?
      puts "Yes"
      break
    elsif stage.infinite_chain?
      puts "No"
      break
    end
  end
end
