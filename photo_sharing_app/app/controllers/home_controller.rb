class HomeController < ApplicationController
  def index
    substring = params[:search_text].to_s
    @users = User.find_by_sql("SELECT * FROM users WHERE username LIKE '%#{substring}%'").sort_by! { |u| u.username }
    photos = Photo.find_by_sql("SELECT * FROM photos WHERE name LIKE '%#{substring}%'")
    tags = Photo.find_by_sql("SELECT * FROM photos WHERE tags LIKE '%#{substring}%'")
    photo_entries = (photos + tags).sort_by! { |p| p.name }
    if photo_entries.include?(Photo.unscoped.find_by_name("default_album_cover_image"))
      photo_entries = photo_entries - [Photo.unscoped.find_by_name("default_album_cover_image")]
    end
    @photos = photo_entries.uniq
    @albums = Album.find_by_sql("SELECT * FROM albums WHERE name LIKE '%#{substring}%'").sort_by! { |a| a.name }
  end
end