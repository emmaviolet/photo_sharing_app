class HomeController < ApplicationController

  def index
    substring = params[:search_text].to_s
    @users = User.find_by_sql("SELECT * FROM users WHERE email LIKE '%#{substring}%'")
    @photos = Photo.find_by_sql("SELECT * FROM photos WHERE name LIKE '%#{substring}%'")
    @tags = Tag.find_by_sql("SELECT * FROM tags WHERE text LIKE '%#{substring}%'")
    @albums = Album.find_by_sql("SELECT * FROM albums WHERE name LIKE '%#{substring}%'")
  end

end