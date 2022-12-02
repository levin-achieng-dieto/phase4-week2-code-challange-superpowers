Power.destroy_all
Hero.destroy_all
HeroPower.destroy_all


5.times do
    Hero.create(name:Faker::Name.name, 
    super_name:Faker::Name.last_name)
end

5.times do
    Power.create(name:Faker::Ancient.hero,
    description:Faker::Lorem.paragraph)
end

HeroPower.create(hero_id: 2, power_id: 4)
HeroPower.create(hero_id: 1, power_id: 5)
HeroPower.create(hero_id: 3, power_id: 1)
HeroPower.create(hero_id: 2, power_id: 4)
HeroPower.create(hero_id: 5, power_id: 1)
HeroPower.create(hero_id: 3, power_id: 2)