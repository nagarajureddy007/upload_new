require 'youtube_it'
class HomeController < ApplicationController
	def index
	 @folder = Folder.all.reverse
	end
     



     
	def create
	  folder = Folder.create(name: params[:name])
	  # folder.save
	  redirect_to :controller=>"home" ,:action=>"index"
	end

	def save_videos
	  @folder = Folder.find(params[:id])
	  @video = Video.new
	  if current_user.admin?
	  	@videos = @folder.videos
	  else
	  	@videos = @folder.videos.where(user_id: current_user.id)
	  end
	end

	def folder_videos_save
#		raise params.inspect
	  folder = Folder.find(params[:id])
	  user = User.find_by_email(params[:email])
	  params[:video].merge!({user_id: user.id})
	  video = folder.videos.create(params[:video])
	  video.save
	  redirect_to :controller=>'home',:action=>'save_videos',:id=>params[:id]
	end

	def upload_video
		folder = Folder.find(params[:video][:folder_id])
		@video = folder.videos.create({ title: params[:title], content: params[:content]})	
	  temp_params = { title: params[:title], content: params[:content], category: 'Education', keywords: [] }
	  if current_user
	  	youtube = Video.yt_session
	    upload_info = youtube.upload_token(temp_params, save_upload_video_home_index_url(:video_id => @video.id))
	    render json: {token: upload_info[:token], url: upload_info[:url]}
	  else
	    render json: {error_type: 'Not authorized.', status: :unprocessable_entity}
	  end
	end

	def save_upload_video
    @video = Video.find(params[:video_id])
    if params[:status].to_i == 200
    	youtube_url = "https://www.youtube.com/watch?v="+params[:id].to_s
      @video.update_attributes(:url => youtube_url)
    end
    redirect_to controller: 'home',action: 'save_videos',id: @video.folder.id#, :notice => "video successfully uploaded"
	end

end
