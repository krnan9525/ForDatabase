---Normally used
select * from rtable;
select * from MENU_TYPE;
select * from MORDER;
select * from menu;
select * from Table_booking;
---question 3
select count(*) from TABLE_BOOKING where BOOKING_NAME is null;
---question 4
SELECT count(*) from Table_booking where  BOOKING_NAME = 'Quaverly' and months_between(SYSDATE, to_date(TRUNC( BOOK_DATE ))) <=6;
---question 5
SELECT count(*) counted_num , BOOKING_NAME from Table_booking where BOOKING_NAME is not null group by BOOKING_NAME having count(*) >2;
---question 6
select * from MENU where MENU_TIME = 'EBIRD'
  union select * from MENU where MENU_TIME = 'DNNER';
---question 7
select DISH from MENU where MENU_TIME = 'EBIRD'
  INTERSECT select DISH from MENU where MENU_TIME = 'DNNER';
---question 8
select DISH from MENU where MENU_TIME = 'DNNER'
   MINUS select DISH from MENU where MENU_TIME = 'EBIRD';
---question 9
select unique tlocation as table_Location from rtable 
  inner join table_booking on (rtable.TableNo = table_booking.TABLENO) 
  inner join morder on (table_booking.TABLENO = morder.TABLENO and table_booking.BOOK_DATE = morder.BOOK_DATE)
  inner join MENU on (morder.menu_number=menu.menu_number) 
  inner join MENU_TYPE on (MENU.MENU_TIME=MENU_TYPE.MENU_TIME)--and MENU_TYPE.MENU_TIME_DESCRIPTION='Breakfast - early til late')
  where MENU_TYPE.MENU_TIME_DESCRIPTION='Early Bird';
---question 12
select unique * from rtable where TABLENO in 
  (select TABLENO from rtable 
    minus select tableno from MORDER);
---question 13
select unique * from rtable where TABLENO in 
  (select tableno from MORDER);
---question 15
select table_booking.BOOKING_NAME, SUM( mOrder.quantity * menu.price) AS TotalPrice
  from table_booking
  join mOrder on Table_booking.TableNo=mOrder.TableNo and Table_Booking.Book_date=mOrder.Book_date
  join menu on menu.MENU_NUMBER=mOrder.MENU_NUMBER
  group by table_booking.BOOKING_NAME;