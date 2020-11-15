ItemStatus.delete_all
ItemStatus.new(id: 1, label: '新品・未使用').save(validate: false)
ItemStatus.new(id: 2, label: '未使用に近い').save(validate: false)
ItemStatus.new(id: 3, label: '目立った傷や汚れなし').save(validate: false)
ItemStatus.new(id: 4, label: 'やや傷や汚れあり').save(validate: false)
ItemStatus.new(id: 5, label: '傷や汚れあり').save(validate: false)
ItemStatus.new(id: 6, label: '全体的に状態が悪い').save(validate: false)
ItemStatus.new(id: 7, label: 'メモ書きがされている').save(validate: false)
