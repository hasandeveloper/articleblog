class User < ApplicationRecord

has_many :reviews
has_many :articles
# has_many :persons
has_many :permissions
has_many :roles, through: :permissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 validates_presence_of :username, :mobile, :gender, :dob

after_create :assign_customer_role

def assign_customer_role
  Permission.create(user_id:self.id, role_id:Role.last.id)
end


def role?(role)
    self.roles.pluck(:name).include? role
   end


end
