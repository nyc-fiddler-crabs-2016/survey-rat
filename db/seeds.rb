
user1 = User.create(username: "Petey101", password:"password")
user2 = User.create(username: "plonsker", password:"password")
user3 = User.create(username: "greensneakers", password:"password")

users = [user1, user2, user3]
users.each do |user|
  3.times { user.surveys << Survey.create(title: Faker::Company.name) }
end

question_counter = 1
Survey.all.each do |survey|
  5.times do
   survey.questions << Question.create(content: "Question#{question_counter}" )
   question_counter += 1
 end
end

choice_counter = 1
Question.all.each do |question|
  4.times do
    question.possible_choices << PossibleChoice.create(option: "option #{choice_counter}")
    choice_counter += 1
  end
end

# users for votes
vote_users = []
30.times {vote_users << User.create(username: Faker::Company.name, password: "password")}
