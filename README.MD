## database
```sql
create table member_table(
    id bigint primary key auto_increment,
    memberEmail varchar(30) unique,
    memberPassword varchar(20) not null,
    memberName varchar(20) not null,
    memberBirth date not null,
    memberMobile varchar(30) not null
);
```

## naming rules
id, class, function, name
id, class, urls: 두단어 이상 연결시 - 로 연결 (member-email)
function: 두단어 이상 연결시 _ 로 연결 (member_email)
name: 두단어 이상 연결시 camel case로 작성 (memberEmail)