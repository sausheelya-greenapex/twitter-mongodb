class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  belongs_to :user
end
