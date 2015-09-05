class Flask
  attr_accessor :solute, :solvent

  def initialize
    @solute  = 0r
    @solvent = 0r
  end

  def discard(mass)
    r = mass / total
    @solute  *= (1 - r)
    @solvent *= (1 - r)
  end

  def total
    solute + solvent
  end

  def info
    p(
      solute: solute,
      solvent: solvent,
      total: total
    )
  end
end

flask = Flask.new

OP_ADD_SOLVENT = 1
OP_ADD_SOLUTE  = 2
OP_DISCSRD     = 3

gets
ARGF.each do |line|
  op, mass = line.split.map(&:to_r)
  case op
  when OP_ADD_SOLUTE
    flask.solute += mass
  when OP_ADD_SOLVENT
    flask.solvent += mass
  when OP_DISCSRD
    flask.discard(mass)
  end
end

puts(((flask.solute / flask.total) * 100).floor)
