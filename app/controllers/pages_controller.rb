class PagesController < ApplicationController
  def home
    @list = ["Thing1", "Thing2", "Thing3"]

    @list2 = ["1", "2", "3"]
  end
end
