ItemCategory.delete_all
ItemCategory.new(id: 1, label: '教科書', sort: 1).save(validate: false)
ItemCategory.new(id: 2, label: 'レジュメ', sort: 2).save(validate: false)
ItemCategory.new(id: 3, label: 'その他', sort: 3).save(validate: false)

ItemSubCategory.delete_all
ItemSubCategory.new(id: 1, label: '文学', sort: 1).save(validate: false)
ItemSubCategory.new(id: 2, label: '語学', sort: 2).save(validate: false)
ItemSubCategory.new(id: 3, label: '法学', sort: 3).save(validate: false)
ItemSubCategory.new(id: 4, label: '経済・経営・商学', sort: 4).save(validate: false)
ItemSubCategory.new(id: 5, label: '社会学', sort: 5).save(validate: false)
ItemSubCategory.new(id: 6, label: '国際関係学', sort: 6).save(validate: false)
ItemSubCategory.new(id: 7, label: '看護・保健学', sort: 7).save(validate: false)
ItemSubCategory.new(id: 8, label: '医・歯学', sort: 8).save(validate: false)
ItemSubCategory.new(id: 9, label: '薬学', sort: 9).save(validate: false)
ItemSubCategory.new(id: 10, label: '理学', sort: 10).save(validate: false)
ItemSubCategory.new(id: 11, label: '工学', sort: 11).save(validate: false)
ItemSubCategory.new(id: 12, label: '農・水産学', sort: 12).save(validate: false)
ItemSubCategory.new(id: 13, label: '教員養成・教育学', sort: 13).save(validate: false)
ItemSubCategory.new(id: 14, label: '生活科学', sort: 14).save(validate: false)
ItemSubCategory.new(id: 15, label: '芸術学', sort: 15).save(validate: false)
ItemSubCategory.new(id: 16, label: '総合科学', sort: 16).save(validate: false)

ItemDepartmentCategory.delete_all
ItemDepartmentCategory.new(id: 1, item_sub_category_id: 1, label: '日本文学', sort: 1).save(validate: false)
ItemDepartmentCategory.new(id: 2, item_sub_category_id: 1, label: '外国文学', sort: 2).save(validate: false)
ItemDepartmentCategory.new(id: 3, item_sub_category_id: 1, label: '哲学・倫理・宗教', sort: 3).save(validate: false)
ItemDepartmentCategory.new(id: 4, item_sub_category_id: 1, label: '心理学', sort: 4).save(validate: false)
ItemDepartmentCategory.new(id: 5, item_sub_category_id: 1, label: '文科学', sort: 5).save(validate: false)
ItemDepartmentCategory.new(id: 6, item_sub_category_id: 1, label: '歴史学', sort: 6).save(validate: false)
ItemDepartmentCategory.new(id: 7, item_sub_category_id: 1, label: '考古学・文化財学', sort: 7).save(validate: false)
ItemDepartmentCategory.new(id: 8, item_sub_category_id: 1, label: '地理学', sort: 8).save(validate: false)

ItemDepartmentCategory.new(id: 9, item_sub_category_id: 2, label: '外国語学', sort: 9).save(validate: false)
ItemDepartmentCategory.new(id: 10, item_sub_category_id: 2, label: '日本語学', sort: 10).save(validate: false)
ItemDepartmentCategory.new(id: 11, item_sub_category_id: 2, label: '言語学', sort: 11).save(validate: false)

ItemDepartmentCategory.new(id: 12, item_sub_category_id: 3, label: '法学', sort: 12).save(validate: false)
ItemDepartmentCategory.new(id: 13, item_sub_category_id: 3, label: '政治学', sort: 13).save(validate: false)

ItemDepartmentCategory.new(id: 14, item_sub_category_id: 4, label: '経済学', sort: 14).save(validate: false)
ItemDepartmentCategory.new(id: 15, item_sub_category_id: 4, label: '経営・商学', sort: 15).save(validate: false)
ItemDepartmentCategory.new(id: 16, item_sub_category_id: 4, label: '経営情報学', sort: 16).save(validate: false)

ItemDepartmentCategory.new(id: 17, item_sub_category_id: 5, label: '社会学', sort: 17).save(validate: false)
ItemDepartmentCategory.new(id: 18, item_sub_category_id: 5, label: '社会福祉学', sort: 18).save(validate: false)
ItemDepartmentCategory.new(id: 19, item_sub_category_id: 5, label: '観光学', sort: 19).save(validate: false)
ItemDepartmentCategory.new(id: 20, item_sub_category_id: 5, label: 'マスコミ学', sort: 20).save(validate: false)

ItemDepartmentCategory.new(id: 21, item_sub_category_id: 6, label: '国際関係学', sort: 21).save(validate: false)

ItemDepartmentCategory.new(id: 22, item_sub_category_id: 7, label: '看護学', sort: 22).save(validate: false)
ItemDepartmentCategory.new(id: 23, item_sub_category_id: 7, label: '医療技術', sort: 23).save(validate: false)
ItemDepartmentCategory.new(id: 24, item_sub_category_id: 7, label: '保健学', sort: 24).save(validate: false)
ItemDepartmentCategory.new(id: 25, item_sub_category_id: 7, label: '体育・健康科学', sort: 25).save(validate: false)

ItemDepartmentCategory.new(id: 26, item_sub_category_id: 8, label: '医学', sort: 26).save(validate: false)
ItemDepartmentCategory.new(id: 27, item_sub_category_id: 8, label: '歯学', sort: 27).save(validate: false)

ItemDepartmentCategory.new(id: 28, item_sub_category_id: 9, label: '薬学', sort: 28).save(validate: false)

ItemDepartmentCategory.new(id: 29, item_sub_category_id: 10, label: '数学', sort: 29).save(validate: false)
ItemDepartmentCategory.new(id: 30, item_sub_category_id: 10, label: '物理学', sort: 30).save(validate: false)
ItemDepartmentCategory.new(id: 31, item_sub_category_id: 10, label: '科学', sort: 31).save(validate: false)
ItemDepartmentCategory.new(id: 32, item_sub_category_id: 10, label: '生物学', sort: 32).save(validate: false)
ItemDepartmentCategory.new(id: 33, item_sub_category_id: 10, label: '地球科学', sort: 33).save(validate: false)
ItemDepartmentCategory.new(id: 34, item_sub_category_id: 10, label: '情報科学', sort: 34).save(validate: false)
ItemDepartmentCategory.new(id: 35, item_sub_category_id: 10, label: '総合科学', sort: 35).save(validate: false)

ItemDepartmentCategory.new(id: 36, item_sub_category_id: 11, label: '機械工学', sort: 36).save(validate: false)
ItemDepartmentCategory.new(id: 37, item_sub_category_id: 11, label: '電気・電子・通信工学', sort: 37).save(validate: false)
ItemDepartmentCategory.new(id: 38, item_sub_category_id: 11, label: '情報工学', sort: 38).save(validate: false)
ItemDepartmentCategory.new(id: 39, item_sub_category_id: 11, label: '建築・土木・環境工学', sort: 39).save(validate: false)
ItemDepartmentCategory.new(id: 40, item_sub_category_id: 11, label: '応用科学', sort: 40).save(validate: false)
ItemDepartmentCategory.new(id: 41, item_sub_category_id: 11, label: '応用物理学', sort: 41).save(validate: false)
ItemDepartmentCategory.new(id: 42, item_sub_category_id: 11, label: '資源・エネルギー工学', sort: 42).save(validate: false)
ItemDepartmentCategory.new(id: 43, item_sub_category_id: 11, label: '金属・材料工学', sort: 43).save(validate: false)
ItemDepartmentCategory.new(id: 44, item_sub_category_id: 11, label: '商船学', sort: 44).save(validate: false)
ItemDepartmentCategory.new(id: 45, item_sub_category_id: 11, label: '船舶・海洋工学', sort: 45).save(validate: false)
ItemDepartmentCategory.new(id: 46, item_sub_category_id: 11, label: '航空・宇宙工学', sort: 46).save(validate: false)
ItemDepartmentCategory.new(id: 47, item_sub_category_id: 11, label: '経営工学', sort: 47).save(validate: false)
ItemDepartmentCategory.new(id: 48, item_sub_category_id: 11, label: '生物工学', sort: 48).save(validate: false)
ItemDepartmentCategory.new(id: 49, item_sub_category_id: 11, label: '工業デザイン', sort: 49).save(validate: false)

ItemDepartmentCategory.new(id: 50, item_sub_category_id: 12, label: '農学', sort: 50).save(validate: false)
ItemDepartmentCategory.new(id: 51, item_sub_category_id: 12, label: '森林科学', sort: 51).save(validate: false)
ItemDepartmentCategory.new(id: 52, item_sub_category_id: 12, label: '農芸化学', sort: 52).save(validate: false)
ItemDepartmentCategory.new(id: 53, item_sub_category_id: 12, label: '農業科学', sort: 53).save(validate: false)
ItemDepartmentCategory.new(id: 54, item_sub_category_id: 12, label: '獣医学', sort: 54).save(validate: false)
ItemDepartmentCategory.new(id: 55, item_sub_category_id: 12, label: '農業経済学', sort: 55).save(validate: false)
ItemDepartmentCategory.new(id: 56, item_sub_category_id: 12, label: '水産学', sort: 56).save(validate: false)
ItemDepartmentCategory.new(id: 57, item_sub_category_id: 12, label: '畜産学', sort: 57).save(validate: false)

ItemDepartmentCategory.new(id: 58, item_sub_category_id: 13, label: '教員養育系', sort: 58).save(validate: false)
ItemDepartmentCategory.new(id: 59, item_sub_category_id: 13, label: '教育学', sort: 59).save(validate: false)
ItemDepartmentCategory.new(id: 60, item_sub_category_id: 13, label: 'その他教育学', sort: 60).save(validate: false)

ItemDepartmentCategory.new(id: 61, item_sub_category_id: 14, label: '生活科学', sort: 61).save(validate: false)
ItemDepartmentCategory.new(id: 62, item_sub_category_id: 14, label: '食物・栄養学', sort: 62).save(validate: false)
ItemDepartmentCategory.new(id: 63, item_sub_category_id: 14, label: '被服学', sort: 63).save(validate: false)
ItemDepartmentCategory.new(id: 64, item_sub_category_id: 14, label: '児童学', sort: 64).save(validate: false)
ItemDepartmentCategory.new(id: 65, item_sub_category_id: 14, label: '住居学', sort: 65).save(validate: false)

ItemDepartmentCategory.new(id: 66, item_sub_category_id: 15, label: '美術・デザイン', sort: 66).save(validate: false)
ItemDepartmentCategory.new(id: 67, item_sub_category_id: 15, label: '芸術理論', sort: 67).save(validate: false)
ItemDepartmentCategory.new(id: 68, item_sub_category_id: 15, label: '音楽', sort: 68).save(validate: false)
ItemDepartmentCategory.new(id: 69, item_sub_category_id: 15, label: 'その他芸術', sort: 69).save(validate: false)

ItemDepartmentCategory.new(id: 70, item_sub_category_id: 16, label: '人間科学', sort: 70).save(validate: false)
ItemDepartmentCategory.new(id: 71, item_sub_category_id: 16, label: '総合科学', sort: 71).save(validate: false)
ItemDepartmentCategory.new(id: 72, item_sub_category_id: 16, label: '総合情報学', sort: 72).save(validate: false)