class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :quote, :employees
  has_many :projects
end
