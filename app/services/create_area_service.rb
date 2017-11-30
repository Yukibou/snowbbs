class CreateAreaService
  AREAS = %w(大雪山系 富良野岳・三段山・十勝周辺 ニセコ山系・羊蹄山 札幌、小樽周辺 北海道その他道東、知床、日高等 八甲田・岩木山 岩手山・八幡平 蔵王山系 鳥海山・月山 朝日連峰・飯豊山 磐梯・安達太良・天元台・吾妻連峰 東北その他 尾瀬・至仏山・武尊山 谷川岳・かぐら・巻機山・平標山 守門岳・浅草岳・越後駒・会津駒 志賀高原・草津白根山 頚城山系・妙高・雨飾山・大渚山・戸隠・黒姫山 上信越その他 富士山・八ヶ岳・蓼科 鹿島槍・五竜岳・白馬岳 剱・立山・槍ケ岳・穂高岳 乗鞍高原・御嶽山・宝剣岳 中部その他 白山山系 氷ノ山・大山 関西その他 日本以外 投稿練習用)

  NEW_AREAS = [[1, '大雪山 Daisetsuzan'],
              [2, '十勝岳 Tokachi-dake'],
              [3, 'ニセコ Niseko'],
              [4, '札幌 Sapporo'],
              [5, '北海道その他 Hokkaido others'],
              [6, '八甲田 Hakkoda'],
              [7, '八幡平 Hachimantai'],
              [8, '蔵王 Zao'],
              [9, '月山 Gassan'],
              [10, '朝日・飯豊 Asahi/Iide'],
              [11, '磐梯・吾妻 Bandai/Azuma'],
              [12, '東北その他 Tohoku others'],
              [13, '武尊山 Hotaka-san'],
              [14, '谷川・かぐら Tanigawa/Kagura'],
              [15, '会津駒 Aizukoma'],
              [16, '志賀高原 Shigakogen'],
              [17, '妙高・戸隠 Myoko/Togakushi'],
              [18, '上信越その他 Joshinetsu others'],
              [19, '八ヶ岳 Yatsugatake'],
              [20, '白馬 Hakuba'],
              [21, '立山・穂高 Tateyama/Hotaka'],
              [22, '乗鞍・宝剣 Norikura/Houken'],
              [23, '中部その他 Chubu others'],
              [24, '白山 Hakusan'],
              [25, '大山 Daisen'],
              [26, '関西その他 Kansai others'],
              [27, '日本以外 Overseas'],
              [28, '投稿練習用 Test']].freeze

  def call
    AREAS.each do |area|
      Area.find_or_create_by!(name: area)
    end
  end

  def update
    NEW_AREAS.each do |id, area_name|
      area = Area.find id
      area.update_column(:name, area_name)
    end
  end
end
