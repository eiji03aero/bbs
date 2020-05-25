# bbs

```
- bbs on terminal
- reference
  - ddd
    - https://magazine.rubyist.net/articles/0056/0056-hanami.html
    - https://github.com/paulrayner/ddd_sample_app_ruby
  - when install
    - bundle config set path 'vendor/bundle'
```

# Todo

```
- seed data
  - users, boards, posts
  - faker
- relationships
- service
- refactor repeating codes like query::where,limit
  - https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/http/request.rb#L50
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
