first_item, second_item, third_item = Item.create!([
  {
    name: 'Headset Gamer HyperX Cloud Stinger - HX-HSCS-BK/LA',
    description: 'Headset muito bom',
    barcode: '740617255485',
    price: 231_47,
    available_quantity: 452
  },
  {
    name: 'Memória HyperX Fury, 8GB, 2400MHz, DDR4, CL15, Preto - HX424C15FB3/8',
    description: 'Memória bom para um PC gamer',
    barcode: '740617241044',
    price: 221_06,
    available_quantity: 1431
  },
  {
    name: 'Monitor Gamer AOC Hero LED 24 Widescreen, Full HD, HDMI/VGA/DVI/DP',
    description: 'Bom pra quem jogar FPS',
    barcode: '7898930919362',
    price: 1376_35,
    available_quantity: 41
  }
])

first_sale, second_sale = Sale.create!([
  {
    order_number: '123',
    total_value: 231_47
  },
  {
    order_number: '456',
    total_value: 1818_47
  }
])

SubSale.create!([
  {
    item: first_item,
    sale: first_sale,
    quantity: 1,
    subtotal: 231_47
  },
  {
    item: second_item,
    sale: second_sale,
    quantity: 2,
    subtotal: 442_12
  },
  {
    item: third_item,
    sale: second_sale,
    quantity: 1,
    subtotal: 1818_47
  }
])