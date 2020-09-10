# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  yr         :integer          not null
#  band_id    :integer          not null
#  studio     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :title, :yr, presence: true 
    validates :studio, inclusion: {in: [true, false]}

    belongs_to :band,
        foreign_key: :band_id,
        class_name: 'Band'

    has_many :tracks,
        foreign_key: :album_id,
        class_name: 'Track'
end
