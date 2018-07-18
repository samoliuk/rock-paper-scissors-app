require 'rails_helper'

RSpec.describe CompetitionService do
  subject { CompetitionService.new(params) }

  let(:generate) { ->(type) { allow(subject).to receive(:generate_sign).and_return(type) } }
  let(:result) { subject.call.result }

  let(:won)  { 'Won' }
  let(:lose) { 'Lose' }
  let(:tie)  { 'Tie' }

  context 'Rock' do
    let(:params) { { sign: 'rock' } }

    it 'beats scissors' do
      generate['scissors']
      expect(result).to eq won
    end

    it 'beaten by paper' do
      generate['paper']
      expect(result).to eq lose
    end

    it 'tied with rock' do
      generate['rock']
      expect(result).to eq tie
    end
  end

  context 'Paper' do
    let(:params) { { sign: 'paper' } }

    it 'beats rock' do
      generate['rock']
      expect(result).to eq won
    end

    it 'beaten by scissors' do
      generate['scissors']
      expect(result).to eq lose
    end

    it 'tied with paper' do
      generate['paper']
      expect(result).to eq tie
    end
  end

  context 'Scissors' do
    let(:params) { { sign: 'scissors' } }

    it 'beats paper' do
      generate['paper']
      expect(result).to eq won
    end

    it 'beaten by rock' do
      generate['rock']
      expect(result).to eq lose
    end

    it 'tied with scissors' do
      generate['scissors']
      expect(result).to eq tie
    end
  end
end
