class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :goods, dependent: :destroy

        has_many :likes, dependent: :destroy
        has_many :liked_goods, through: :likes, source: :good

        has_many :comments, dependent: :destroy

        has_many :goods, dependent: :destroy
        validates :username, presence: true
        validates :profile, length: { maximum: 200 }

        def already_liked?(good)
          self.likes.exists?(good_id: good.id)
        end

end
