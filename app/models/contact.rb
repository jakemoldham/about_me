class Contact

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :message

  validates :name, :email, :message,
    presence: true

end
