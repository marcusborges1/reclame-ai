# Geocoder Test Loopkup
Geocoder.configure(lookup: :test, ip_lookup: :test)

Geocoder::Lookup::Test.set_default_stub(
  [
    {
      coordinates:    [-23.5511736, -46.6340015],
      address:        'Praça da Sé, Sé, São Paulo',
      state:          'São Paulo',
      country:        'Brasil',
      country_code:   'br'
    }
  ]
)