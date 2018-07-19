class Preference < ActiveRecord::Base
  belongs_to :user

  def preference
    if current_user?

    end
  end
end
