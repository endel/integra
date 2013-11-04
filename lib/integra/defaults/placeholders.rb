placeholder :url do
  match /([a-z0-9A-Z\.\-\/]+)/ do |url|
    url
  end
end

placeholder :float do
  match /[0-9\.]+/ do |float|
    float.to_i
  end
end

placeholder :int do
  match /[0-9]+/ do |int|
    int.to_i
  end
end

placeholder :selector do
  match /'([^']+)'/ do |selector|
    selector
  end
end

placeholder :email do
  match /([a-z0-9\.\-@]+)/ do |email|
    email
  end
end

