class PasswordComplexityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless value.length >= 6 &&
           value =~ /[A-Z]/ &&
           value =~ /\d/ &&
           value =~ /[^A-Za-z0-9]/
      record.errors.add(attribute, 'debe tener al menos 6 caracteres, una mayúscula, un número y un carácter especial')
    end
  end
end
