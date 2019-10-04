# MiniApp DB Setting

## users table
|Column|Type|Options|
|------|----|-------|
|id|integer|primarykey|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :reviews

## reviews table
|Column|Type|Options|
|------|----|-------|
|id|integer|primarykey|
|title|string|null: false|
|name_family|string|null: false, index|
|name_first|string||
|place|string||
|body|text||
### Association
- belongs_to :user