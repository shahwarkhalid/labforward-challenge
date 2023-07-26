# Project Information

- Ruby 2.7.4
- Rails 6.1.4
- PostgreSQL

# Project setup steps

- bundle install
- rails db:create
- rails db:migrate
- rails db:seed

# Editing credentials
  You need master key to edit the credentials. Contact developer or get from heroku config.

  EDITOR=nano rails credentials:edit

# Problem description
  Develop a simple Rails REST endpoint that identifies sudden peaks in real-time continuous time series data, so that the researchers can focus on important changes. A data point is considered a peak in a time series when the moving z-score is beyond a given threshold.

# Example
As an example, one potential implementation could be described like this:

##### Input Description
- Measured data
- Threshold

##### Output Description
- Signal data

##### Example Input
```
{
  "data": [1,1.1,0.9,1,1,1.2,2.5,2.3,2.4,1.1,0.8,1.2,1],
  “threshold”: 3
}
```

##### Expected Output
```
{
  "signal": [0,0,0,0,0,0,1,1,1,0,0,0,0]
}
```
