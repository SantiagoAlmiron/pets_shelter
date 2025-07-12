class EmailDomainValidator < ActiveModel::EachValidator
  VALID_DOMAINS = %w[
    gmail.com yahoo.com outlook.com hotmail.com
  ]

  def validate_each(record, attribute, value)
    return if value.blank?
    domain = value.split('@').last
    unless VALID_DOMAINS.include?(domain)
      record.errors.add(attribute, 'debe tener un dominio de email reconocido')
    end
  end
end
