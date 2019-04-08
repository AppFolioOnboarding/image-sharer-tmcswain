# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

urls = %w[
  https://www.visitcalifornia.com/sites/default/files/styles/welcome_image/public/vc_spotlight_santabarbara_hero_st_rm_529573764_1280x640_0.jpg
  https://images.trvl-media.com/hotels/1000000/30000/25200/25115/4a357def_z.jpg
  https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Aerial-SantaBarbaraCA10-28-08.jpg/300px-Aerial-SantaBarbaraCA10-28-08.jpg
  https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Santa_Barbara_Downtown_%28may_2012%29_%282%29_%28cropped%29.jpg/1200px-Santa_Barbara_Downtown_%28may_2012%29_%282%29_%28cropped%29.jpg
  https://media.timeout.com/images/105164980/630/472/image.jpg
  https://santabarbaraca.com/content/uploads/2015/12/Itineraries-santa-barbara_1.jpg
  https://s-ec.bstatic.com/images/hotel/max1024x768/140/140990525.jpg
  https://www.paradiseretreats.com/wp-content/uploads/2016/08/santa-barbara-1584103_1280.jpg
  https://img1.coastalliving.timeinc.net/sites/default/files/styles/4_3_horizontal_-_1200x900/public/image/2017/04/main/4066402-santa-barbara-california.jpg?itok=0Kd1hBzq
  https://www.canarysantabarbara.com/images/1700-960/santa-barbara-c40b3426.jpg
  http://caps.sa.ucsb.edu/images/default-source/Santa-Barbara/bigstock-santa-barbara-from-the-pier-24425663.jpg?sfvrsn=4
  https://santabarbaraca.com/content/uploads/2015/08/santa-barbara-shopping-paseo-nuevo.jpg
  https://santabarbaraca.com/content/uploads/2015/08/outdoor-recreation-santa-barbara.jpg
  https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Santabarbarastreetscene.jpg/220px-Santabarbarastreetscene.jpg
  https://www.travelfashiongirl.com/wp-content/uploads/2017/07/what-to-wear-in-santa-barbara.jpg
  https://www.hotelmilosantabarbara.com/wp-content/uploads/2017/06/GettyImages-517458772.jpg
  https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fcdn-image.travelandleisure.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F1600x1000%2Fpublic%2Fparadise-beach-santa-barbara-california-santabarbara0815.jpg%3Fitok%3D7bfFg-ws&w=450&c=sc&poi=face&q=85
  https://www.hotelmilosantabarbara.com/wp-content/uploads/2018/05/GettyImages-825714402.jpg
  https://www.noozhawk.com/images/uploads/slideshows/OSD-mission-fo-1000.jpg
  http://www.ipsbonline.org/Santa-Barbara-beauty.jpg
  https://www.visitcalifornia.com/sites/default/files/styles/welcome_image/public/VCW_D_CC_T1_CTTC10031816193286.jpg
  https://www.santabarbarafamilylife.com/wp-content/uploads/2018/04/santa-barbara-courhouse-update.jpg
  https://eatthisshootthat.com/wp-content/uploads/2018/05/herndon_ben_ChannelIslandsAdventure20180224_452-750x422.jpg
  https://santabarbaraca.com/content/uploads/2015/12/next-month-in-santa-barbara.jpg
  https://stories.forbestravelguide.com/wp-content/uploads/2018/03/HERO-SantaBarbaraMontecito-SantaBarbaraAerial-CreditBlakeBronstad.jpg
]

urls.each do |url|
  Image.create(url: url)
end
