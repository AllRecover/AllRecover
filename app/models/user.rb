class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # mount_uploader :profile_img, ImgUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :kakao]
  # User.find_auth
  after_commit :preference_create, on: :create
  has_one :preference
  has_many :indentities




  def preference_create
    Preference.create(user_id: self.id)
  end

  def self.find_auth(auth, signed_in_resource=nil)
    # Identity가 있는지?
    identity=Identity.find_auth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user
    # user가 있는지?
    # Identity에 uid랑 provider 정보가 일치하는게 없으면 새로만든다 => user는 nil이다.
    # 만약에 일치한다면, user_id가 있을거니까 user 오브젝트가 리턴
    if user.nil? # identity에 등록된 user가 있는지?
      user = User.find_by(email: auth.info.email)
      if user.nil? # User에 email을 쓰고 있는가
        if auth.provider == 'kakao'
          user = User.new(
            name: auth.info.name,
            password: Devise.friendly_token[0,20],
            profile_img: auth.info.image
          )
        else
          user = User.new(
            email: auth.info.email,
            name: auth.info.name,
            password: Devise.friendly_token[0,20],
            profile_img: auth.info.image
          )
        end
      end
      user.save!
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end

    user


  end

  def email_required?
    false
  end


end
