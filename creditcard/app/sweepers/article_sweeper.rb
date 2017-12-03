class ArticleSweeper < AcitonController::Caching::Sweeper
  observer Article

  def after_create(article)
    expire_public_page
  end

  def after_update(article)
    expire_public_page
    expire_article_page(article.id)
  end

  def after_destroy(article)
    expire_public_page
    expire_article_page(article.id)
  end

  private

  def expire_public_page
    expire_page(:controller => "content", :action => 'public_content')
  end

  def expire_article_page
    expire_action(:controller => "content",
		  :action     => "premium_content",
		  :id         => article_id)
  end
end

class ContentController < ApplicationController

  before_filter  :verigy_premium_user, :except => :public_content
  caches_page    :public_content
  caches_sweeper :article_sweeper,
	         :only => [ :create_article,
                            :update_article,
                            :delete_artilce ]
  #...
end

