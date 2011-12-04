class TagsController < ApplicationController
  def index
    require 'will_paginate/array'
    @tag = Tag.where("name like ?", "%#{params[:q]}%")
    @tags = @tag
    respond_to do |format|
          format.html
          format.json { render :json => @tags  }
        end
  end

  def show
  end

  def new
  end

  def destroy
  end

  def delete
  end

  def create
  end

end
