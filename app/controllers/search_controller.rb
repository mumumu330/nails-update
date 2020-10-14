class SearchController < ApplicationController

  before_action :authenticate_user!

  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        User.where('name LIKE ?', '%'+content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'post_image'
      if method == 'perfect'
        PostImage.where(caption: content)
      elsif method == 'forward'
        PostImage.where('caption LIKE ?', content+'%')
      elsif method == 'backward'
        PostImage.where('caption LIKE ?', '%'+content)
      else
        PostImage.where('caption LIKE ?', '%'+content+'%')
      end
    end
  end
end
