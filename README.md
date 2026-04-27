# BookNest – Online Könyváruház

**Rails webalkalmazás a BME Webfejlesztés tárgy házi feladataihoz.**

- **Hallgató:** Rába Tamás  
- **Neptun-kód:** CRLJQ8  
- **Rails verzió:** 7.1  
- **Ruby verzió:** 3.2  
- **Adatbázis:** MySQL / MariaDB  

---

## Telepítés és futtatás

### Előfeltételek

- Ruby 3.2+
- Rails 7.1+
- MySQL / MariaDB (root felhasználó, üres jelszó, localhost)

### 1. Függőségek telepítése

```bash
bundle install
```

### 2. Adatbázis létrehozása és migrálása

```bash
rails db:create
rails db:migrate
rails db:seed
```

A `db:seed` parancs létrehozza az alap kategóriákat és 6 példakönyvet.

### 3. Szerver indítása

```bash
rails server
```

Az alkalmazás elérhető: [http://localhost:3000](http://localhost:3000)

---

## Az alkalmazás funkciói

| Képernyő | URL | Leírás |
|---|---|---|
| Főoldal | `/` | Hero banner + kiemelt könyvek |
| Könyvlista | `/books` | Keresés, szűrés, rendezés |
| Könyv részletei | `/books/:id` | Adatlap, kosárba gomb |
| Kosár | `/cart` | Tételek, összesítő, megrendelés |
| Bejelentkezés | `/login` | Session alapú auth |
| Regisztráció | `/register` | Új felhasználó |
| Profil szerkesztés | `/users/:id/edit` | Név, email, jelszó módosítása |

---

## Adatbázis struktúra

```
users          – felhasználói fiókok (bcrypt jelszó)
categories     – könyv kategóriák
books          – könyvek (cím, szerző, ár, leírás, stb.)
orders         – leadott rendelések
order_items    – rendelés tételei (könyv + mennyiség + ár)
```

### Modellek közötti kapcsolatok

- `User` has_many `Order`
- `Book` belongs_to `Category`, has_many `OrderItem`
- `Order` belongs_to `User`, has_many `OrderItem`
- `OrderItem` belongs_to `Order`, belongs_to `Book`

---

## Mappák

```
app/
  controllers/   – BooksController, CartsController, SessionsController, UsersController
  models/        – Book, Category, User, Order, OrderItem
  views/         – ERB sablonok (books, carts, sessions, users, layouts)
  assets/        – CSS (application.css)
config/
  routes.rb      – URL útvonalak
  database.yml   – MySQL konfiguráció
db/
  migrate/       – Adatbázis migrációk
  seeds.rb       – Alap adatok (5 kategória, 6 könyv)
```
