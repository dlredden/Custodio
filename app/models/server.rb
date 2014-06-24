class Server < ActiveRecord::Base
	belongs_to :company
	encrypt_with_public_key :admin_user, :admin_password, :public_key => Rails.root.join('config','public.pem')
end
