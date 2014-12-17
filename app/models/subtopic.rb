class Subtopic < ActiveRecord::Base
  belongs_to :topic

  has_many :proofs
  has_many :examples
end
