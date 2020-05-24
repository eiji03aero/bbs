# bbs

```
- bbs on terminal
- reference
  - ddd
    - https://magazine.rubyist.net/articles/0056/0056-hanami.html
    - https://github.com/paulrayner/ddd_sample_app_ruby
  - add load path
    - https://stackoverflow.com/questions/837123/adding-a-directory-to-load-path-ruby
  - when install
    - bundle config set path 'vendor/bundle'
```

# Todo

```
- Validator
- user
  - validation
- board
  - validation
- post
  - validation
- json_db
  - JSONDB::Client
    - JSONDB::Query
    - JSONDB::Command
- service
```

# Apis

```
- crud user
- crud board
- crud message
```

# Models

```
- User
  - properties
    - id int serial not null
    - name string not null
  - methods
    - #posts () => Post[]
    - #boards () => Board[]
- Board
  - properties
    - id int serial not null
    - name string not null
  - methods
    - #users () => User[]
    - #posts () => Post[]
- Post
  - properties
    - id int serial not null
    - user_id int serial not null
    - board_id int serial not null
    - content text default ""
  - methods
    - #user () => User
    - #board () => Board
```
