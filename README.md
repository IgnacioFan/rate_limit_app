## Intro

A rate limit application with the following limit setting:
- 60 requests per minute per IP address
- Error will be returned if the quantity of the requests meets the threshold

## How to use

```ruby
# setup dependencies
bundle install

# launch the Rails server
rails s

# make api request
curl http://localhost:3000/api/v1/test
```

## Run test

```ruby
rspec spec/requests
```
