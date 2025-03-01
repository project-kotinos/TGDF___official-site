# frozen_string_literal: true

class Agenda < ApplicationRecord
  translates :subject, :description

  has_many :agendas_speakers, dependent: :destroy
  has_many :speakers, through: :agendas_speakers

  has_many :taggings, class_name: 'AgendasTagging', dependent: :destroy
  has_many :tags, through: :taggings

  belongs_to :time, class_name: 'AgendaTime', foreign_key: :time_id,
                    inverse_of: :agendas, optional: true
  belongs_to :room, optional: true

  default_scope -> { order(order: :asc, id: :asc) }

  enum language: {
    ZH: 1,
    EN: 2,
    JP: 3
  }

  enum translated_language: {
    ZH: 1,
    EN: 2,
    JP: 3
  }, _prefix: :translated

  enum translated_type: {
    sentence: 1,
    synchornize: 2
  }

  validates :subject, :description, presence: true
end
