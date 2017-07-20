json.array! @messages do |message|
  json.id        message.id
  json.name      message.name
  json.date      message.date
  json.body      message.body
  json.image     message.image
end
