class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations

    mount_uploader :image, ImageUploader

    def self.search(search)
       if search
        Room.where(['address LIKE ?', "%#{search}%"])
       else
        Room.all
       end
    end
end    
