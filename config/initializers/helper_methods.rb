module ActiveModel::Validations::HelperMethods
  def validates_file(*attr_names)
    validates_with AttachedValidator, _merge_attributes(attr_names)
  end
end
