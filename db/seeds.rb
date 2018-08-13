password = '000000'
1.upto(5) do |i|
  User.create(
    email: "#{i}@#{i}",
    password: password,
    password_confirmation: password,
    name: "덕후#{i}"
  )
end