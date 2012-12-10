#!/usr/bin/ruby -w
    
require File.join(File.dirname(__FILE__), 'gilded_rose')

#-------------------------------------------------------
puts "Sulfura tests"
sulfuras = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=10, quality=70),
                    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)]
gilded_rose = GildedRose.new
(0...1).each do |day|
  gilded_rose.update_quality(sulfuras)
end
sulfuras.each do |item|
  puts "We expect quality to be 80: this is " + (item.quality == 80).to_s()
end
puts ""
#-------------------------------------------------------
puts "Aged Brie test that quantity does not exceed 50"
aged_bries = [Item.new(name="Aged Brie", sell_in=10, quality=49)]
gilded_rose = GildedRose.new
(0...1).each do |day|
  gilded_rose.update_quality(aged_bries)
end
aged_bries.each do |item|
  puts "We expect quality to be less than or equal to 50: this is " + (item.quality <= 50).to_s()
end
puts ""
#-------------------------------------------------------
puts "Normal item quantity degrades"
normal_item = [Item.new(name="Broadsword of doom", sell_in=1, quality=50)]
gilded_rose = GildedRose.new
(0..1).each do |day|
  puts normal_item
  gilded_rose.update_quality(normal_item)
end
normal_item.each do |item|
  puts "We expect quality after two days to be 47: this is " + (item.quality == 47).to_s()
  puts item
end
puts ""
#-------------------------------------------------------
puts "Backstage pass item quality 10 day or less increase"
backstage_item = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=9, quality=10)]
gilded_rose = GildedRose.new
(0..1).each do |day|
  gilded_rose.update_quality(backstage_item)
end
backstage_item.each do |item|
  puts "We expect quality to equal to 14: this is " + (item.quality == 14).to_s()
end
puts ""
#-------------------------------------------------------
puts "Backstage pass item quality 5 day or less increase"
backstage_item = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=4, quality=10)]
gilded_rose = GildedRose.new
(0..1).each do |day|
  gilded_rose.update_quality(backstage_item)
end
backstage_item.each do |item|
  puts "We expect quality to equal to 16: this is " + (item.quality == 16).to_s()
end
puts ""
#-------------------------------------------------------
puts "Backstage pass item quality drops 0 after last sell date"
backstage_item = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=1, quality=10)]
gilded_rose = GildedRose.new
(0..3).each do |day|
  gilded_rose.update_quality(backstage_item)
end
backstage_item.each do |item|
  puts "We expect quality to equal to 0: this is " + (item.quality == 0).to_s()
end
puts ""
#-------------------------------------------------------



