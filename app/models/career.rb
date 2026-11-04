class Career < ActiveRecord::Base
  
  attr_accessor :terms

  has_attached_file :cv
  do_not_validate_attachment_file_type :cv
  #validates_with AttachmentSizeValidator, attributes: :cv, less_than: 5.megabytes
  # validates_attachment_presence :cv, message: 'Трябва да се попълни'

  validates_presence_of :first_name, :last_name, :phone, :city, :terms

  validates :first_name, length: { in: 2..20, message: 'трябва да бъде между 2 и 20 символа.' }
  validates :last_name, length: { in: 2..20, message: 'трябва да бъде между 2 и 20 символа.' }
  validates :phone, length: { in: 9..15, message: 'трябва да бъде между 9 и 15 символа.' }
  validates :email, length: {in: 3..40, message: 'трябва да бъде между 3 и 40 символа.'}, allow_blank: true


  def admin_path
    "#{Rails.application.config.base_url}site_admin/career/#{id}"
  end

end
