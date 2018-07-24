class Hospital < ActiveRecord::Base
  has_one :hospeval

  has_many :codecls
  has_many :codesgs
  has_many :codesis
  has_many :hospsbjs
  has_many :noncondition
  has_many :disease
end
