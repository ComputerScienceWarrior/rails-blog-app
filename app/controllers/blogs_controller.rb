class BlogsController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @blogs = Blog.all
    end

    def show
        @user = @blog.user
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            redirect_to user_blog_path(current_user, @blog)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @blog.update(blog_params)
            redirect_to user_blog_path(current_user, @blog)
        else
            render :edit
        end
    end

    def destroy
        @blog.destroy
        redirect_to root_path
    end

    private 

    def blog_params
        params.require(:blog).permit(:title, :content, :description)
    end

    def find_blog
        @blog = Blog.find(params[:id])
    end
end
