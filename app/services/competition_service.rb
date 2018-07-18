class CompetitionService
  attr_accessor :user_choice, :server_choice, :result

  def initialize(params)
    @user_choice = params[:sign]
  end

  def call
    self.tap do |service|
      service.server_choice = service.generate_sign
      service.result = service.compete
    end
  end

  def generate_sign
    %w(rock scissors paper).sample
  end

  def compete
    case
    when @user_choice == @server_choice
      'Tie'
    when (@user_choice == 'paper' && @server_choice == 'rock') ||
         (@user_choice == 'scissors' && @server_choice == 'paper') ||
         (@user_choice == 'rock' && @server_choice == 'scissors')
      'Won'
    else
      'Lose'
    end
  end
end
