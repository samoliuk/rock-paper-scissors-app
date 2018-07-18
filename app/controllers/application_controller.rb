class ApplicationController < ActionController::Base
  # make protect_from_forgery the first filter
  protect_from_forgery with: :exception, prepend: true
end
