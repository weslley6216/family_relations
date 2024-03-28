class Person < ApplicationRecord
  belongs_to :mother, class_name: 'Person', optional: true
  belongs_to :father, class_name: 'Person', optional: true
  has_many :children, class_name: 'Person', foreign_key: 'mother_id'

  def siblings
    return [] unless mother_id

    Person.where(id: sibling_ids)
  end

  def relatives
    relative_ids = sibling_ids + [mother_id, father_id]
    Person.where(id: relative_ids.compact.uniq)
  end

  def sibling_ids
    mother.children.where.not(id: id).pluck(:id)
  end
end
