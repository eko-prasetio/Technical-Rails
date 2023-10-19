class Book < ApplicationRecord
    validates_uniqueness_of :id
    validates :judul, uniqueness: { case_sensitive: false, message: " sudah ada, cari yang lain!!" }
    belongs_to :author

    validates :judul, presence: true
    validates :tahun_terbit, presence: true
    validates :author_id, presence: true
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'is not a valid email address' }
end