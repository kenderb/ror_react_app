# Courses library with Ruby on Rails and React

This project is a full-stack application built with React and Ruby on rails. This app gives you de possibility to create courses with students and instructors and you can track how many times a student read a book.
> You have the option to edit a user name just by selecting the email. For easy choice of emails you can select it in the select input field inside the form and update the name of that user as you please.

## Built With

- React.
- Ruby on rails.
- RSpec.
- Whenever for cron jobs.


## Demo Screenshots

<img width="1424" alt="image" src="https://user-images.githubusercontent.com/40863532/168177720-142f7441-0f9a-4282-98d7-db4a39d879df.png">

<img width="1424" alt="image" src="https://user-images.githubusercontent.com/40863532/168176338-31c6126a-c8c6-4500-91fb-43c47a2d87ac.png">


## Prerequisites

- Ruby: 2.7.2
- Rails: 5.2.8
- Node: 14.18.3

## Getting Started
To get a local copy up and running follow these simple example steps.

- Open a terminal or command prompt interface on your PC.
- Clone the repo with: `git clone https://github.com/kenderb/ror_react_app.git`
- On the terminal navigate to the project directory using `cd ror_react_app/`

## 📝 Setup

1. Install dependencies by using: `bundle install`.
2. Run rails server: `rails s`.
3. Run webpacker: `./bin/webpack-dev-server `.
4. To create a cron job for populating the database locally use: `bundle exec whenever --update-crontab --set environment=development` or run `bundle exec rake populate_db` if you don want to wait for the cron process.
5. Open `http://localhost:3000/` in your browser.

## :straight_ruler: Running test

1. On the terminal navigate to the project directory using `cd marvel-catalogue/`.
2. Run tests with: `bundle exec rspec`.


## Authors

👤 **Kender Bolivar**

- GitHub: [@kenderb](https://github.com/kenderb)
- Twitter: [@KBTarts](https://twitter.com/KBTarts)
- LinkedIn: [KenderBolivar](https://www.linkedin.com/in/kender-bolivar-1736086b/)
