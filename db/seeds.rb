password = '000000'
1.upto(5) do |i|
  User.create(
    email: "#{i}@#{i}",
    password: password,
    password_confirmation: password,
    name: "덕후#{i}",
    birthyear: "199#{i}",
    kakao: "kaka#{i}",
    sex: 'Female',
    region: '수도권',
    interest: 'BLACKPINK'
  )
end