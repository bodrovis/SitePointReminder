json.array! @todos.each do |todo|
  json.id todo.id
  json.title todo.title
end