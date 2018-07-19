namespace :dev  do
  task fake_users: :environment do
    User.destroy_all
    user = User.new(
        email: "test@test.com",
        password: "123456",
        name: FFaker::Name::first_name,
        intro: FFaker::Lorem::sentence(30),
        company: FFaker::Company::name,
        title: FFaker::Job::title,
        website: "test.website.com",
        twitter: "test.twitter",
        github: "test.github"
      )
    user.save!
    puts "帳：test@test.com"
    puts "密：123456"
    15.times do |i|     
      user = User.new(
        email: FFaker::Name::first_name + "@example.com",
        password: "123456",
        name: FFaker::Name::first_name,
        intro: FFaker::Lorem::sentence(30),
        company: FFaker::Company::name,
        title: FFaker::Job::title,
        website: "test" + i.to_s + ".website.com",
        twitter: "test" + i.to_s + ".twitter",
        github: "test" + i.to_s + ".github"
      )
      user.save!
      puts user.email
    end
    puts "其他15個使用者假資料建立完成"
  end
  
  task fake_questions: :environment do
    # 未來 question 假資料做在這裡
  end
  
  task fake_answers: :environment do
    # 未來 answer 假資料做在這裡
  end
  
  task fake_favorites: :environment do
    # 未來 favorite 假資料做在這裡
  end

  # 快速一個指令重建
  task rebuild: [
    "db:drop",
    "db:create",
    "db:migrate",
    "db:seed",
    :fake_users,
    :fake_questions,
    :fake_answers,
    :fake_favorites
    ]

end