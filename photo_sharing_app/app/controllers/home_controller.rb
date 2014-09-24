class HomeController < ApplicationController
  def index
    substring = params[:search_text].to_s
    @users = User.find_by_sql("SELECT * FROM users WHERE username LIKE '%#{substring}%'").sort_by! { |u| u.username }
    photos = Photo.find_by_sql("SELECT * FROM photos WHERE name LIKE '%#{substring}%'")
    tags = Tag.find_by_sql("SELECT * FROM tags WHERE text LIKE '%#{substring}%'").map { |t| t.photo }
    @photos = (photos + tags).sort_by! { |p| p.name }.uniq!
    @albums = Album.find_by_sql("SELECT * FROM albums WHERE name LIKE '%#{substring}%'").sort_by! { |a| a.name }
  end
end