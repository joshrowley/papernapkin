class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  has_many :messages

  def full_name
    "#{first_name} #{last_name}"
  end
end
