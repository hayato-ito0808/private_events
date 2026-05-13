# Private Events

A Rails application inspired by Eventbrite.  
Users can create events, attend events, and view events created by others.

This project focuses on modeling complex associations in Rails, including:
- Self-referential associations
- Many-to-many relationships
- Custom foreign keys
- Class name overrides

---

## ✨ Features

### 👤 Users
- Create an account
- Create events (as a **creator**)
- Attend events created by others
- View events they are attending
- View events they have created

### 🎉 Events
- Each event has:
  - A **creator** (User)
  - A **date**
  - A **location**
  - A **title**
- Users can attend many events
- Events can have many attendees

---

## 🗂️ Database Structure

### Users
| Column | Type |
|--------|------|
| id | integer |
| name | string |

### Events
| Column | Type | Description |
|--------|------|-------------|
| id | integer |
| creator_id | integer | references `users.id` |
| name | string |
| date | datetime |
| location | string |

### Event Attendances (Join Table)
| Column | Type |
|--------|------|
| id | integer |
| user_id | integer |
| event_id | integer |

---

## 🔗 Associations

### User model
```rb
class User < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"

  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, source: :event
end
