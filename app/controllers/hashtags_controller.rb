class HashtagsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destory]

  
end
