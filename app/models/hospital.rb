class Hospital < ActiveRecord::Base
  has_many :codecls
  has_many :codesgs
  has_many :codesis
  has_many :hospsbjs
end
