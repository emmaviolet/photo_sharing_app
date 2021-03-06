class PhotosController < ApplicationController

  before_filter :authenticate_user!, except: :index

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.find_with_reputation(:votes, :all, order: 'votes desc')
    @photos = Kaminari.paginate_array(@photos).page(params[:page]).per(4)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new
    @photo.album_id = params[:album_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        if params[:subaction] == "false"
          format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
          format.json { render json: @photo, status: :created, location: @photo }
        else
          format.html { redirect_to new_photo_path(album_id: @photo.album.id), notice: 'Photo was successfully added.'}
        end
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  def vote
    @photo = Photo.find(params[:id])
    reputation = @photo.reputation_for(:votes).to_i 
    value = params[:type] == "up" ? 1 : -1
    @photo.add_or_update_evaluation(:votes, value, current_user)
    if @photo.reputation_for(:votes).to_i != reputation
      redirect_to :back, notice: "Thank you for sharing your opinion on this lovely photo."
    else
      redirect_to :back, notice: "You have already voted that way. No more!"
    end
  end 

end
