class PostsController < ApplicationController

    before_action :set_post, only: [:edit, :update, :show]
    
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
           flash[:errors] = @post.errors.full_messages 
           render :new
        end
    end

    def edit
        
    end

    def update
       @post.update(post_params) 
       redirect_to post_path(@post)
    end

    def show

    end

    def add_like
        post = Post.find(params[:post_id])
        post.likes += 1
        post.save
        redirect_to post_path(post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end