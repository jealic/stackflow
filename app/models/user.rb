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
#  role                   :string
#  name                   :string
#  company                :string
#  title                  :string
#  intro                  :text
#  website                :string
#  twitter                :string
#  github                 :string
#  image                  :string
#  questions_count        :integer          default(0)
#  answers_count          :integer          default(0)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :destroy
  #一個 user 可以問好多個問題
  has_many :questions, through: :answers
  # 一個 user 可以有多個回答過的問題

  has_many :answers, dependent: :restrict_with_error
end
