require 'peep'
require 'database_helpers'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      peep1 = Peep.post(peep: 'What a beautil day!')
      peep2 = Peep.post(peep: 'Going for a run now')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.peep).to eq 'Going for a run now'
      expect(peeps.first.id).to eq peep2.id
    end

    it 'returns the peeps in reverse chronological order' do
      peep1 = Peep.post(peep: 'Oldest peep')
      peep2 = Peep.post(peep: 'Newest peep')

      peeps = Peep.all
      peeps.first.timestamp

      expect(peeps.first.peep).to eq 'Newest peep'
      expect(peeps.last.peep).to eq 'Oldest peep'
    end
  end

  describe '#post' do
    it 'posts a new peep' do
      peep = Peep.post(peep: 'Studying all the weekend long...')
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.peep).to eq 'Studying all the weekend long...'
      expect(peep.id).to eq persisted_data.first['id']
    end
  end
end
