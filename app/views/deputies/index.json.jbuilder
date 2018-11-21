json.deputies @deputies do |deputy|
  json.id deputy.id
  json.name deputy.name
  json.surname deputy.surname
  json.patronymic deputy.patronymic
  json.current_position deputy.current_position
  json.photo deputy.photo

  json.deeds deputy.deeds do |deed|
    json.position deed.position
    json.id deed.id
    json.sign deed.sign
    json.punishment deed.punishment
    json.status deed.status
    json.detriment deed.detriment
    json.date deed.date
    json.region_code deed.region.region_code
    json.links deed.links
  end
end
