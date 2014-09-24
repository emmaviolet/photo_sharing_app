class HomeController < ApplicationController
  def index
    substring = params[:search_text].to_s
    @users = User.find_by_sql("SELECT * FROM users WHERE username LIKE '%#{substring}%'").sort_by! { |u| u.username }
    photos = Photo.find_by_sql("SELECT * FROM photos WHERE name LIKE '%#{substring}%'")
    tags = Photo.find_by_sql("SELECT * FROM photos WHERE tags LIKE '%#{substring}%'")
    photo_entries = (photos + tags).sort_by! { |p| p.name }
    @photos = photo_entries.uniq
    @albums = Album.find_by_sql("SELECT * FROM albums WHERE name LIKE '%#{substring}%'").sort_by! { |a| a.name }
  end
end