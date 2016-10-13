# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create(id: 1, name: '山田太郎', email: 'taro@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 2, name: '鈴木次郎', email: 'jiro@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 3, name: '田中花子', email: 'hanako@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 4, name: '加藤三郎', email: 'saburo@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 5, name: '山口智史', email: 'satoshi@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 6, name: '山中健三', email: 'kenzo@example.com', password: 'testtest', password_confirmation: 'testtest')

Group.delete_all
Group.create(id: 1, name: 'チャット1')
Group.create(id: 2, name: 'チャット2')

Chat.delete_all
Chat.create(id: 1, user_id: 1, group_id: 1, body: 'Hello World!')
Chat.create(id: 2, user_id: 2, group_id: 1, body: '返信テスト')
Chat.create(id: 3, user_id: 3, group_id: 1, body: '3人目')
Chat.create(id: 4, user_id: 1, group_id: 1, body: 'もう一度テスト')
Chat.create(id: 5, user_id: 1, group_id: 1, body: 'もう一度テスト')
Chat.create(id: 6, user_id: 1, group_id: 1, body: 'もう一度テスト')
Chat.create(id: 7, user_id: 1, group_id: 1, body: 'もう一度テスト')
Chat.create(id: 8, user_id: 1, group_id: 1, body: 'もう一度テスト')
