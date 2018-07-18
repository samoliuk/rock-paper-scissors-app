require 'rails_helper'

RSpec.describe ThrowsController, type: :controller do
  let(:post_request) { post :throw, params: { sign: 'rock', format: :json } }

  let(:sign_list) { %w(rock paper scissors) }
  let(:result_list) { %w(Tie Won Lose) }

  describe 'POST #throw' do

    before { post_request }

    it 'assigns @game to a CompetitionService object' do
      expect(assigns(:game)).to be_a(CompetitionService)
    end

    it 'has correct user_choice value' do
      expect(response.body).to be_json_eql('rock'.to_json).at_path('user_choice')
    end

    it 'has correct server_choice value' do
      expect(sign_list).to include(JSON.parse(response.body)['server_choice'])
    end

    it 'has correct result value' do
      expect(result_list).to include(JSON.parse(response.body)['result'])
    end
  end
end
