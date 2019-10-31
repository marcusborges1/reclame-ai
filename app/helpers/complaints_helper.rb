module ComplaintsHelper
  TRUST_RATING = {
    not_verified: 'Não verificado',
    safe: 'Seguro',
    suspect: 'Suspeito'
  }.freeze

  def translate_safety(trust_rating)
    TRUST_RATING[trust_rating.to_sym]
  end
end
