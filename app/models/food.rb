class Food < ApplicationRecord

  validates :way, :motivation, :wards, :table, :people, :time, :service, presence: true
  # validates :way,              presence: true
  # validates :motivation,       presence: true
  # validates :wards,            presence: true
  # validates :table,            presence: true
  # validates :people,           presence: true
  # validates :time,             presence: true
  # validates :service,          presence: true
  validates :way_eq, :motivation_eq, :wards_eq, :table_eq_eq, :people_eq, :time_eq, presence: true

  belongs_to :user
  belongs_to :genre

  enum way: {
    職場の近く:1, 自宅の近く:2, 用件先の近く:3
  },_prefix: true

  enum motivation: {
    同僚と:1, デート:2, 友達と:3, 家族と:4
  },_prefix: true


  enum wards:{
    千代田区:1,中央区:2,港区:3,新宿区:4,文京区:5,台東区:6,墨田区:7,
    江東区:8,品川区:9,目黒区:10,大田区:11,世田谷区:12,渋谷区:13,中野区:14,
    杉並区:15,豊島区:16,北区:17,荒川区:18,板橋区:19,練馬区:20,
    足立区:21,葛飾区:22,江戸川区:23,
  }
 
  enum table: {
    カウンター:1, テーブル:2, 個室:3
  },_prefix: true

  enum people:{
    "1人":1, "2人":2, "3〜4人":3,"5人~":4,"8人~":5,"12人~":6,
  },_prefix: true

  enum time: {
    ランチ:1, カフェ:2, ディナー:3, ミッドナイト:4,
  },_prefix: true

  # def self.search(search)
  #   return Food.all unless search
  #   Food.where(' LIKE (?)', "%#{search}%")
  # end



  validates :way,              presence: true
  validates :motivation,       presence: true
  validates :wards,            presence: true
  validates :table,            presence: true
  validates :people,           presence: true
  validates :time,             presence: true
  validates :service,          presence: true
  # validates :name, :description,  :category_id, :condition, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, presence: true


end
