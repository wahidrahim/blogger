class Author < ActiveRecord::Base
  authenticates_with_sorcery!
	validates_confirmation_of :password, message: "passwords do not match", if: :password
end
