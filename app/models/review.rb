# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id          :uuid             not null, primary key
#  username    :string           not null
#  description :text
#  score       :integer          not null
#  place_id    :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ApplicationRecord
  validates :username, presence: true
  validates :score, numericality: { only_integer: true, greater_than: 0, less_than: 6, message: 'must be between 1-5' }

  belongs_to :place
end
