class GifsController < ApplicationController
  # GET /gifs
  # GET /gifs.json
  def index
    if params[:team].present?
      @gifs = Gif.find_all_by_team params[:team]
    else
      @gifs = Gif.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gifs }
    end
  end

  # GET /gifs/1
  # GET /gifs/1.json
  def show
    @gif = Gif.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gif }
    end
  end

  # GET /gifs/new
  # GET /gifs/new.json
  def new
    @gif = Gif.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gif }
    end
  end

  # GET /gifs/1/edit
  def edit
    @gif = Gif.find(params[:id])
  end

  # POST /gifs
  # POST /gifs.json
  def create
    form_data = params[:gif]
    url = "/archive/#{params[:gif][:team]}/#{params[:gif][:player]}_#{params[:gif][:number]}.gif"
    form_data[:url] = url
    @gif = Gif.new(form_data)

    respond_to do |format|
      if @gif.save
        format.html { redirect_to @gif, notice: 'Gif was successfully created.' }
        format.json { render json: @gif, status: :created, location: @gif }
      else
        format.html { render action: "new" }
        format.json { render json: @gif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gifs/1
  # PUT /gifs/1.json
  def update
    @gif = Gif.find(params[:id])

    respond_to do |format|
      if @gif.update_attributes(params[:gif])
        format.html { redirect_to @gif, notice: 'Gif was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifs/1
  # DELETE /gifs/1.json
  def destroy
  #   @gif = Gif.find(params[:id])
  #   @gif.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to gifs_url }
  #     format.json { head :no_content }
  #   end
  end
end
