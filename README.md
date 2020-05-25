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
- foreign key restriction
  - make sure foreign key referenced does exist
- refactor repeating codes like query::where,limit
  - https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/http/request.rb#L50
- create tui
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
- UserRepository
  - methods
    - #posts_for (User) => Post[]
    - #boards_for (User) => Board[]

- Board
  - properties
    - id int serial not null
    - name string not null
- BoardRepository
  - methods
    - #users_for (Board) => User[]
    - #posts_for (Board) => Post[]

- Post
  - properties
    - id int serial not null
    - user_id int not null
    - board_id int not null
    - content text default ""
- PostRepository
  - methods
    - #user_for () => User
    - #board_for () => Board
```
