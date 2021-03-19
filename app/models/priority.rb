# == Schema Information
#
# Table name: priorities
#
#  id                    :integer          not null, primary key
#  day                   :date
#  description           :string
#  priority_accomplished :boolean          default(FALSE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
class Priority < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  validates(:day, { :presence => true })
end
