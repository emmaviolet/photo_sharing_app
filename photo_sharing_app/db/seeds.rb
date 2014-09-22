Album.delete_all
Photo.delete_all
User.delete_all
Rating.delete_all
Tag.delete_all
Comment.delete_all

names = ["Emma", "Shehryar", "Hisako", "Francesco", "Stef", "Luke", "Lee", "Akunor", "Abdul", "Anand", "Colin", "Habib", "Kate", "Laurence", "Michael", "Jarkyn", "Alex"]

names.each do |name|
  u = User.create email: "#{name.downcase}@wdi.io", password: "password", username: "#{name}", password_confirmation: "password"
  u.save(:validate => false)
end

album_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

40.times do |n|
  a = Album.create name: "#{album_names.sample}", user_id: "#{User.all.sample.id}"
  a.save
end

photo_names = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

100.times do |n|
  p = Photo.create name: "#{photo_names.sample}", album_id: "#{Album.all.sample.id}"
  p.save
end

rating_values = [1, -1]

300.times do |n|
  r = Rating.create value: "#{rating_values.sample}", photo_id: "#{Photo.all.sample.id}", user_id: "#{User.all.sample.id}"
  r.save
end

comment_texts = ["awesome!", "great!", "loved it", "a bit rubbish", "something else please", "not as good as my photo"]

300.times do |n|
  c = Comment.create text: "#{comment_texts.sample}", photo_id: "#{Photo.all.sample.id}", user_id: "#{User.all.sample.id}"
  c.save
end

tag_texts = ["funny", "cats", "dogs", "lazy", "sunny", "yolo"]

300.times do |n|
  t = Tag.create text: "#{tag_texts.sample}", photo_id: "#{Photo.all.sample.id}"
  t.save
end
