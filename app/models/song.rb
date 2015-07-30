class Song < ActiveRecord::Base
  validates :title, presence: true

  # def to_param
  #   title
  # end
end
