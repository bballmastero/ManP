class User < ActiveRecord::Base
def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end
end

has_many :posts

=begin
has_many :followers, through: :follower_relationships
has_many :followeds, through: :followed_relationships

def following? user
  self.followed.include? user
end
def follow user
  Relationship.create follower_id: self.id, followed_id: user.id
end
     =end
