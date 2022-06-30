class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 一意性を持たせかつ2~20文字
  validates :name, uniqueness: true, length: { in: 2..20 }
  # 最大50文字
  validates :introduction, length: { maximum: 50 }

  # Bookモデルとのアソシエーション
  has_many :books, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
