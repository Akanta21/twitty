class PageControlController < ApplicationController
  before_action :authenticate_user, only: :private

  # layout 'public'

  def private
    # redirect_to post_path[current_user]
  end

  def public
  end
end
