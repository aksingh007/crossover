class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :custom_roles, class_name: 'Role'
  has_many :answers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  #   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Public: This method overrides role attribute for the user object
  #
  # Returns instance of UserRoles class
  def role
    UserRoles.new(self)
  end

end
