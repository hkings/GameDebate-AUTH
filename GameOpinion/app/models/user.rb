# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Virtual attribute for authenticating by either username or email
# This is in addition to a real persisted field like 'username'


class User < ActiveRecord::Base


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  has_many :users
  has_many :comments
#  def self.find_for_database_authentication(warden_conditions)
#        conditions = warden_conditions.dup
#        if login = conditions.delete(:login)
#          where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
#        elsif conditions.has_key?(:username) || conditions.has_key?(:email)
#          where(conditions.to_h).first
#        end
#      end
  def ldap_before_save
    self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"userPrincipalName").first
  end
end
