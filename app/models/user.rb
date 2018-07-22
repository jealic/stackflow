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

  mount_uploader :image, AvatarUploader #先打此行才 rails g controller users 會出現錯誤
  validates_presence_of :name, :email
  has_many :questions, dependent: :destroy
  #一個 user 可以問好多個問題
  has_many :answered_questions, through: :answers, source: :question
  #一個 user 回答過的問題

  has_many :answers, dependent: :restrict_with_error
  has_many :favorites, dependent: :destroy #個人所有的收藏
  has_many :favorited_questions, through: :favorites, source: :question #個人收藏的『餐廳』

  has_many :upvotes, dependent: :destroy #個人所有的『推』
  has_many :upvoted_questions, through: :upvotes, source: :question #個人推的問題
  has_many :upvoted_answers, through: :upvotes, source: :answer #個人推的答案
end
