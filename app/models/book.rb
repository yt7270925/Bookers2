class Book < ApplicationRecord
  has_one_attached :image

  # Userモデルとのアソシエーション
  belongs_to :user

end
