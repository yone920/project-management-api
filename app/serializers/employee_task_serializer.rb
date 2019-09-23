class EmployeeTaskSerializer < ActiveModel::Serializer
  attributes :id, :hours_done, :employee_id
end
