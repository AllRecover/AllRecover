class Review < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :user
end
