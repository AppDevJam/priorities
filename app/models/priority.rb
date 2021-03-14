# == Schema Information
#
# Table name: priorities
#
#  id          :integer          not null, primary key
#  alert_sent  :boolean
#  day         :date
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Priority < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  validates(:day, { :presence => true })
  validates(:alert_sent, { :presence => true })

end
