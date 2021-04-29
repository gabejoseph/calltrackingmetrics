class Text < ApplicationRecord
    belongs_to :user
    validates :to, :from, phone: true

end

