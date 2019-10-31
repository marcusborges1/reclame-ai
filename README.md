# Reclama aí

## Prerequisites

- rails 6.0.0
- ruby 2.6.3
- redis-server >= 4.0

## Running project (after git clone)

1. Run redis-server on terminal
`$ redis-server`
2. In another tab sets up the database
`$ rails db:setup`
`$ rails db:migrate`
`$ rails db:seed`
3 - Run the server
`$ rails s`

##### What are valid order_number values?
- `123` and `456`