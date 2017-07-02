##usersテーブル

|Column|type|option|
|------|----|------|
|name|string|null: false, index: true, unique: true|
|email|string|null: false, index: true, unique: true|

### Association
- has_many :messages
- has_many :groups, through: :members

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

###Association
- has_many :menbers
- belongs_to :user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|-------|
|image|text|-------|
|user_id|integer|foreign_key: true|
|group_id|integer|foreign_key: true|

###Association
- belongs_to :user
- belongs_to :member
