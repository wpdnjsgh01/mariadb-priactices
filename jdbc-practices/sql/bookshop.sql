-- scheme 확인
desc book;
desc author;

-- insert author
insert into author values(null, '스테파니메이어');
select no, name from author;

-- insert book
insert into book values(null, '이클립스', 1, '대여가능');
select * from book;

-- select book
  select a.no, a.title, a.status, b.name as authorName
    from book a, author b
   where a.author_no = b.no
order by no desc; 
 
-- update book's status(no, status)
update book
   set status='대여중'
 where no=1;
select * from book; 