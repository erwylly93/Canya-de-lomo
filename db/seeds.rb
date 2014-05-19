# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Brand.create(name: 'Navidul', street: 'Andalucía 11', city: 'Sevilla', province: 'Sevilla', phone: 955123456)
Brand.create(name: 'Campofrío', street: 'Buenafuente 2', city: 'Barbate', province: 'Cádiz', phone: 956654321)
Brand.create(name: 'Noel', street: 'Pavo 5', city: 'Córdoba', province: 'Córdoba', phone: 957918283)
Supplier.create(name: 'Repartidores chacinas', street: 'Andalucía 23', city: 'Cádiz', province: 'Cádiz', phone: 956773091)
Supplier.create(name: 'Ibéricos para todos', street: 'Boquerón 20', city: 'Ciudad Real', province: 'Ciudad Real', phone: 931209898)
Supplier.create(name: 'Ibéricos para ti', street: 'Anchoa feliz 2', city: 'Casteldellfels', province: 'Barcelona', phone: 911324300)
Product.create(name: 'Caña suprema', type: 'Caña de lomo', description: 'Caña de lomo de calidad suprema', origin: 'Extremadura', price: 10.38, weight: 0.2)
Product.create(name: 'Jamón pata negra', type: 'Jamón', description: 'Jamón de pata negra de la Sierra de Huelva', origin: 'Sierra de Huelva', price: 190.30, weight: 7.3)
Product.create(name: 'Salchichón jienense', type: 'Salchichón', description: 'Salchichón elaborado de la forma tradicional', origin: 'Jaén', price: 5.40, weight: 0.150)