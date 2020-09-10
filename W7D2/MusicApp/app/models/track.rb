# == Schema Information
#
# Table name: tracks
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  ord          :integer          not null
#  album_id     :integer          not null
#  lyrics       :text
#  bonus_track? :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Track < ApplicationRecord
    belongs_to :album,
        foreign_key: :album_id,
        class_name: 'Album'
end
