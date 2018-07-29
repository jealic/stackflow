namespace :dev  do 
  task fake_users: :environment do
    #User.destroy_all
    user = User.new(
        email: "test@test.com",
        password: "123456",
        name: FFaker::Name::first_name,
        intro: FFaker::Lorem::sentence(30),
        company: FFaker::Company::name,
        title: FFaker::Job::title,
        website: "test.website.com",
        twitter: "test.twitter",
        github: "test.github",
        role: "admin"
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
    Question.destroy_all
    100.times do |q|
      question = Question.create!(
        topic: "Q: " + FFaker::Lorem::sentence + "?",
        content: FFaker::Lorem::sentence(50),
        user_id: User.all.ids.sample
      )
    end
    puts "The above are the questions."
    puts "Have created #{Question.count} questions."
  end

  
  task fake_answers: :environment do
    # 未來 answer 假資料做在這裡
    Answer.destroy_all
    Question.all.each do |question|
      3.times do |i|
        question.answers.create!(
          content: FFaker::Lorem::sentence(50),
          user_id: User.all.ids.sample
          )
      end
    end
    puts "Have created #{Answer.count} answers."
  end
  
  task fake_favorites: :environment do
    # 未來 favorite 假資料做在這裡
    Favorite.destroy_all
    Question.all.each do |question|
      1.times do |i|
        question.favorites.create!(
          user_id: User.all.ids.sample
          )
      end
    end 
    
    puts "Have created #{Favorite.count} favorites for users."
    ###### 無法寫入favorites_count 而不能進行 fake #######
  end

  task fake_q_tagships: :environment do 
    QTagship.destroy_all
    Question.all.each do |question|
      rand(1..3).times do |i|
        question.q_tagships.create(
          hashtag_id: Hashtag.all.sample.id
          
        ) 
      end
    end
    puts "each question has one to three hashtags"
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