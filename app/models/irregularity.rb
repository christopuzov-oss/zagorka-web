class Irregularity < ApplicationRecord
  has_attached_file :file,
	url: '/irregularity_signals/attachments/:id/:filename',
	path: ':rails_root/public/irregularity_signals/attachments/:id/:filename'

#validates_attachment_presence :file
validates_attachment_size :file, less_than: 10.megabytes
#do_not_validate_attachment_file_type :file
validates_attachment_content_type :file, content_type: [
	"image/jpg", "image/jpeg", "image/png", "image/gif", 
	"application/pdf", "application/doc", "application/docx"
]

validate :custom_validation

private 
	def custom_validation
		if name.blank? && email.blank? && phone_number.blank? && message.blank? && address.blank?
			errors.add(:base, "Поне едно от полетата „Три имена“, „Адрес“, „Телефон“, „Имейл“ и „Описание“ следва да съдържат попълнена информация.")
		end
	end 
end
