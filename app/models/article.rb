class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user

    validates :title, presence: true,
    length: { minimum: 5 }
    validates :first_name,:last_name, presence: true,
    length: { minimum: 5 }
    validates :email,uniqueness: true


    def name
        "#{first_name} #{last_name } "
    end
end

