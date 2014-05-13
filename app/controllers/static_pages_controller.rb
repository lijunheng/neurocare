class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def events
  end

  def wikispaces
  end

  def photos
  end

  def blog
  end

  def contact
  end
end
