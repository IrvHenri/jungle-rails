# Background - Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails.

## Project Description

There are multiple high-level goals to this project:

- Become familiar with Ruby and the Rails framework
- Learn how to navigate an existing code-base
- Use existing code style and approach to implement new features in unfamiliar territory
- Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
- A simulation of the real world where feature and bug-fix requests are listed instead of
- step-by-step instructions on how to implement a solution

## Getting Started

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

![](https://github.com/Flora-manda/Jungle-Project/blob/master/doc/Product_homepage.png?raw=true)
![](https://github.com/Flora-manda/Jungle-Project/blob/master/doc/Product_detail.png?raw=true)
![](https://github.com/Flora-manda/Jungle-Project/blob/master/doc/Cart.png?raw=true)
