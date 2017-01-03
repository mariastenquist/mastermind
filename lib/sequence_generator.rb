module Sequence_Generator

  @length = 4
  @pool = %w{b g r y}
  @code = []

  def self.create
    @code = (0...@length).collect{@pool.sample}
  end
end
