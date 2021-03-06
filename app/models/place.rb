# frozen_string_literal: true

# == Schema Information
#
# Table name: places
#
#  id            :uuid             not null, primary key
#  name          :string           not null
#  description   :text
#  address       :string           not null
#  website       :string
#  phone         :string
#  email         :string
#  lat           :float
#  lon           :float
#  average_score :float            default(0.0)
#  is_active     :boolean          default(TRUE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  opening_hours :json
#

class Place < ApplicationRecord
  validates :name, :address, presence: true

  has_and_belongs_to_many :tags
  has_many :reviews

  scope :active, -> { where(is_active: true) }

  def short_data
    {
      id: id,
      name: name,
      description: description,
      address: address,
      average_score: average_score,
    }
  end
end
