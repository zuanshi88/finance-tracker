class User < ApplicationRecord
  has_many :user_stocks 
  has_many :stocks, through: :user_stocks 
  has_many :friendships
  has_many :friends, through: :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  def stock_already_tracked?(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock 
    self.stocks.where(id: stock.id).exists?
  end 
  
  def under_stock_limit?
    self.stocks.count < 5
  end 
  
  def can_track_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_tracked?(ticker_symbol)
  end 

    def friend_already_followed?(friend)
      self.friends.include?(friend)
    end

  def full_name 
   first_name || last_name ? "#{first_name} #{last_name}" : "Anonymous"
  end 

end
