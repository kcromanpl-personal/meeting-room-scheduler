class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :meeting_rooms, dependent: :destroy
#m:n relation with schedules
has_and_belongs_to_many :schedules       
end
