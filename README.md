# Tables

## Users

| column | type   |
| ------ | ------ |
| name   | string |
| email  | string |

## Chats

| column   | type      |
| -------- | --------- |
| body     | text      |
| image    | string    |
| group_id | reference |
| user_id  | reference |

## Groups

| column  | type |
| ------- | ---- |
| group_name | reference |

## Group_users

| column  | type |
| ------- | ---- |
| user_id | reference |
| group_id | reference |

