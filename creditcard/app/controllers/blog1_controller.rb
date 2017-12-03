#encoding: utf-8
class BlogController < ApplicationController
  def list
    @dynamic_content = Time.now.to_s
    unless fragment_exist?(action: 'list')
      logger.info("temp")
      @articles = Article.find_resent
  end
end

