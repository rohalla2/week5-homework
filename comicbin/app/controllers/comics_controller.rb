class ComicsController < ApplicationController
	def index
		@comics = Comic.all

	end

	def new
		@comic = Comic.new
	end

	def create
	    @comic = Comic.new(comic_params)
	    

    	respond_to do |format|
      	if @comic.save
        	format.html { redirect_to comics_path, notice: 'Comic was successfully created.' }
        	format.json { render action: 'show', status: :created, location: @comic }
      	else
        	format.html { render action: 'new' }
        	format.json { render json: @comic.errors, status: :unprocessable_entity }
      	end
    end
		
	end
	
	def show
		id = params["id"]
		@comic = Comic.find_by(id: id)
	end
	
	def destroy
		id = params["id"]
		comic = Comic.find_by(id: id)
		comic.destroy

		redirect_to comics_path
		
	end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comic_params
      params.require(:comic).permit(:title, :description, :image_url)
    end

end
