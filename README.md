# Excuse

Excuse is a small Rails app that generates detailed, believable work-from-home messages addressed to team colleagues. It is intentionally simple: open the page, press the button, and get a new excuse. The interface uses a soft Material-inspired layout with the generated message as the clear focal point.

## Features

- Generates a random, colleague-directed excuse on demand
- Includes more than 700 distinct excuse messages
- Covers illness, recovery, headaches, caring for a niece or nephew, home logistics, transit issues, maintenance windows, and a few lightly funny emergencies
- Uses a lightweight server-rendered Rails flow with a redirecting POST that works cleanly with Turbo
- Keeps the entire excuse catalog in Ruby for fast, dependency-free generation
- Includes RSpec coverage for the generator and request flow

## Requirements

- Ruby 3.3.6
- Bundler 2.5+

## Installation

```bash
bundle install
```

## Run locally

Start the app on the default Rails port:

```bash
bin/rails server
```

Then open <http://localhost:3000>.

If port 3000 is already in use on your machine, choose another port, for example:

```bash
bin/rails server -p 3001
```

## Run the test suite

```bash
bundle exec rspec
```

## Architecture

This app does not use a database. Every generated excuse is assembled from the curated Ruby catalog in `app/services/excuse_generator.rb`, and the selected excuse is carried through the POST/redirect flow in the browser session.

## App structure

- `app/controllers/excuses_controller.rb` handles the landing page and generate action
- `app/services/excuse_generator.rb` owns the catalog and random selection logic
- `app/views/excuses/index.html.erb` renders the main experience
- `app/assets/stylesheets/application.css` defines the Material-inspired presentation
- `spec/services/excuse_generator_spec.rb` and `spec/requests/excuses_spec.rb` cover the core behavior
