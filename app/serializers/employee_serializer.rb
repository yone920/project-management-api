class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :quote, :coworkers
  belongs_to :manager
end
