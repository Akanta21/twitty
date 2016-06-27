class PageControlController < ApplicationController
  before_action :authenticate_user, only: :private

  # layout 'public'

  def private

  end

  def public
  end
end
