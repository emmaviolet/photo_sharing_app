class CommentsController < ApplicationController

  # before_filter Photo: :load_photo

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @photo = Photo.find(params[:photo_id])
    # @comment = Comment.new
    @comment = @photo.comments.build
    @comment.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @comment.user = current_user
  end

  # POST /comments
  # POST /comments.json
  def create
    # @comment = Comment.new(params[:comment])
    # @comment.user = current_user

    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(params[:comment])
    # @comment = Comment.new(params[:comment])
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to :back }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @comment.user = current_user

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
