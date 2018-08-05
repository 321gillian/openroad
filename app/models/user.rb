class User < ApplicationRecord
  enum role: [:user, :vip, :admin]
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # validation
  validates_presence_of :name
  validates_presence_of :address1
  validates_presence_of :address3
  validates_presence_of :county
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
  has_many :orders
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def first_name
    self.name.split.first
  end
  
  def last_name
    self.name.split.last
  end 
  
end



 