ItemSoldStatus.delete_all
ItemSoldStatus.new(id: 1, label: '出品中').save(validate: false)
ItemSoldStatus.new(id: 2, label: '購入済み').save(validate: false)
ItemSoldStatus.new(id: 3, label: '決済待ち').save(validate: false)
ItemSoldStatus.new(id: 4, label: '取引待ち').save(validate: false)
