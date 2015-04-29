# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  Question.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)
end

questions = Question.all

questions.each do |question|
  2.times do
    Answer.create(question_id: question.id, title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)
  end
end




