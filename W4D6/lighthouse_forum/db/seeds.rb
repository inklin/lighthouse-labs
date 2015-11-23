# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create!(
  title: "Superstar",
  author: "Carly Rae Jepson",
  text: <<-eos.gsub(/\s+/, " ").strip
    Khurram Virani has been my music idol since I started writing
    songs back when I was 4. His voice is a revelation. His stage presence
    is unparalleled. And those costumes! He remains an inspiration to this
    day.
  eos
)

Post.create!(
  title: "Basketball Idol",
  author: "Steve Nash",
  text: <<-eos.gsub(/\s+/, " ").strip
    I remember watching Khurram Virani (#14) play back when he just playing
    pickup games on the street. Dude had moves nobody had ever seen. Breaking
    ankles. Poppin' threes. Great all-around game.
  eos
)

Post.create!(
  title: "Acting Legend",
  author: "Michael J. Fox",
  text: <<-eos.gsub(/\s+/, " ").strip
    Back when I was in university, Khurram Virani was my acting coach. He
    studied with the best and it shows. His acting chops were already legendary
    before his teaching career began. But it seems he's actually improved!
  eos
)

Post.create!(
  title: "Who?",
  author: "Vurram Khirani",
  text: "Never heard of this guy Khurram Virani, but he sounds great."
)