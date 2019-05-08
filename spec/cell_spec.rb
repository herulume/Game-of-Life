require 'spec_helper'

require 'cell'

RSpec.describe Cell do
  describe 'attributes' do
    it 'spawns dead by default' do
      c = Cell.new

      expect(c.alive?).to eq(false)
    end

    it 'spawns at origin by default' do
      c = Cell.new

      expect(c.x).to eq(0)
      expect(c.y).to eq(0)
    end

    it 'spawns at random location' do
      x = rand(-10..10)
      y = rand(-10..10)
      c = Cell.new(x, y)

      expect(c.x).to eq(x)
      expect(c.y).to eq(y)
    end

    it 'spawns alive' do
      c = Cell.new(0, 0, true)

      expect(c.alive?).to eq(true)
    end
  end

  describe 'behaviour' do
    it 'can be killed' do
      c = Cell.new(0, 0, true)

      c.kill!

      expect(c.alive?).to eq(false)
    end

    it 'can be revived' do
      c = Cell.new(0, 0, false)

      c.revive!

      expect(c.alive?).to eq(true)
    end

    it 'identifies proper neighbours' do
      x = rand(-10..10)
      y = rand(-10..10)
      offset = rand(2..10)
      c = Cell.new(x, y)

      expect(c.neighbour?(Cell.new(x+1, y))).to eq(true)
      expect(c.neighbour?(Cell.new(x+1, y+1))).to eq(true)
      expect(c.neighbour?(Cell.new(x+1, y-1))).to eq(true)
      expect(c.neighbour?(Cell.new(x, y+1))).to eq(true)
      expect(c.neighbour?(Cell.new(x, y-1))).to eq(true)
      expect(c.neighbour?(Cell.new(x-1, y+1))).to eq(true)
      expect(c.neighbour?(Cell.new(x-1, y))).to eq(true)
      expect(c.neighbour?(Cell.new(x-1, y-1))).to eq(true)
      expect(c.neighbour?(Cell.new(x, y))).to eq(false)
      expect(c.neighbour?(Cell.new(x-offset, y+offset))).to eq(false)
    end
  end
end
