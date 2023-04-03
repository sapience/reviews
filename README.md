# README

## Setup

The project uses **Ruby 3.1.2**, so if you don't have such a version installed and you don't want to install it or you don't want to install new gems, then I recommend using the installation via **Docker**.

An alternative option is to change Ruby version in the project to the one that you have installed. In theory, everything should work, but I haven't tested.

### Clone the project (for native and Docker setups)
```git clone https://github.com/sapience/reviews.git```

```cd``` into the project's folder.

### Docker setup
Run:

```docker compose build```

```docker compose run --rm reviews rails db:create db:migrate db:seed```

```docker compose run --rm reviews rails assets:precompile```

### Native setup

Make sure you have **Ruby** and **yarn** installed.

Run:

```bundle```

```yarn```

```rails db:create db:migrate db:seed```

```rails assets:precompile```


## How to run the application

No additional configuration is required.

The applicatioin will be accessible on http://0.0.0.0:3000

### Docker

```docker compose up```

### Native

```rails s```

## How to run tests

I use Rspec as a test framework.

### Docker

```docker compose --rm reviews rspec```

### Native

```rspec```

## How to change seed data

The initial data is added via the **db/seeds.rb** file.
If you want to reseed data then run:

### Docker

```docker compose --rm reviews rails db:seed```

### Native

```rails db:seed```
