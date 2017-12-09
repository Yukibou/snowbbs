class User < ApplicationRecord
  has_many :observations
  has_many :avalanche_infomations
  enum role: [:undefine, :observer, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :undefine
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
end
