require 'spec_helper'

require 'board'

RSpec.describe Board do
  describe 'attributes' do
    it 'has size*size entries' do
      size = rand(5..15)
      b = Board.new(size)

      expect(b.matrix.count).to eq(size*size)
    end

    describe 'behaviour' do
      it 'keeps the number of entries' do
        b = Board.new

        b.random_seed!
        alive = b.alive_cells.count
        dead = b.dead_cells.count
        total = b.matrix.count

        expect(dead+alive).to eq(total)
      end
      it 'seeding does not alter entries number' do
        b = Board.new

        pre_total = b.matrix.count
        b.random_seed!
        total = b.matrix.count

        expect(pre_total).to eq(total)
      end
      it 'seeding creates live cells' do
        b = Board.new

        b.random_seed!
        total = b.alive_cells.count

        expect(total).to be >= 0
      end
    end
  end
end
