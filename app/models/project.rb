class Project < ApplicationRecord
  validates :name, presence: true
  attribute :name, default: "Untitled Project"
end
