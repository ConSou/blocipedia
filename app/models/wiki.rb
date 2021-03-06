class Wiki < ApplicationRecord
  belongs_to :user

  validates :title, length: {minimum: 3}, presence: true
  validates :body, length: {minimum: 10}, presence: true
  validates :user, presence: true

  after_initialize :set_private

  def set_private
    self.private ||= false
  end

end
