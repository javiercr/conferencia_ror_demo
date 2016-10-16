# /app/models/message.rb

class Message < ApplicationRecord
  validates_presence_of :author, :content
end
