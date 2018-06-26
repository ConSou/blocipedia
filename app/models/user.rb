class User < ApplicationRecord
  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators

  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role
  after_save :downgrade_wikis

  def downgrade_wikis
    if self.standard?
      wikis.where(private: true).update_all(private: false)
    end
  end

  def set_default_role
    self.role ||= :standard
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
