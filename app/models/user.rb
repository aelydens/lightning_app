class User < ActiveRecord::Base
  has_many :talks

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.github_uid = auth["github_uid"]
      user.name = auth["info"]["name"]
    end
  end
end
