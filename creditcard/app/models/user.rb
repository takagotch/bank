class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password

  after_destroy :ensure_an_admin_remains

  private
  def ensure_an_admin_remain
    if User.count.zero?
    railse "Don't delete"
    end

  end

end


