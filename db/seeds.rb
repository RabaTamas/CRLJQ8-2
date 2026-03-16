# db/seeds.rb
# Futtatás: rails db:seed

Category.destroy_all
Book.destroy_all

fikció    = Category.create!(name: 'Fikció')
scifi     = Category.create!(name: 'Sci-fi')
fantasy   = Category.create!(name: 'Fantasy')
thriller  = Category.create!(name: 'Thriller')
gyermek   = Category.create!(name: 'Gyermek')

Book.create!([
  {
    title: 'A kis herceg',
    author: 'Antoine de Saint-Exupéry',
    publisher: 'Móra',
    year: 2020, pages: 96,
    isbn: '978-963-415-123-1',
    description: 'Antoine de Saint-Exupéry örökbecsű meseregénye a felnőtt világ és a gyermeki tisztaság szembeállításáról szól.',
    price: 1990, featured: true, category: gyermek
  },
  {
    title: 'Harry Potter és a bölcsek köve',
    author: 'J.K. Rowling',
    publisher: 'Animus',
    year: 2021, pages: 312,
    isbn: '978-963-577-001-2',
    description: 'A fiatal Harry Potter megismeri varázslatos örökségét és belép a Roxfort varázsló iskola falai közé.',
    price: 3490, featured: true, category: fantasy
  },
  {
    title: 'Dune',
    author: 'Frank Herbert',
    publisher: 'Galaktika',
    year: 2022, pages: 688,
    isbn: '978-963-372-042-3',
    description: 'A Dune Frank Herbert kultikus sci-fi regénye, amely egy sivatagos bolygón, Arrakon játszódik. A hatalom, vallás és ökológia nagy eposza.',
    price: 4990, featured: true, category: scifi
  },
  {
    title: '1984',
    author: 'George Orwell',
    publisher: 'Európa',
    year: 2019, pages: 352,
    isbn: '978-963-075-850-4',
    description: 'Orwell disztópiája egy totális diktatúra által uralt világban játszódik, ahol a Nagy Testvér mindent lát.',
    price: 2490, featured: true, category: fikció
  },
  {
    title: 'A Gyűrűk Ura – A Gyűrű Szövetsége',
    author: 'J.R.R. Tolkien',
    publisher: 'Európa',
    year: 2021, pages: 576,
    isbn: '978-963-075-900-6',
    description: 'Tolkien monumentális fantasy eposza, amelyben Frodó és társai vállalkoznak a végzet gyűrűjének megsemmisítésére.',
    price: 5990, featured: false, category: fantasy
  },
  {
    title: 'A Da Vinci-kód',
    author: 'Dan Brown',
    publisher: 'Gabo',
    year: 2020, pages: 480,
    isbn: '978-963-689-200-1',
    description: 'Robert Langdon szimbológiaprofesszor egy rejtélyes gyilkossági ügybe keveredik, amely a kereszténység legféltettebb titkaival fonódik össze.',
    price: 2990, featured: false, category: thriller
  },
])

puts "Seed kész: #{Category.count} kategória, #{Book.count} könyv létrehozva."
