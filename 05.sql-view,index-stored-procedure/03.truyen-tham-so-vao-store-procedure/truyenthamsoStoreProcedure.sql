use classicmodels;

call getCusById(175);

call getCustomersCountByCity('NYC', @total);
select @total;

set @counter = 1;

call setCounter(@counter,1);
call setCounter(@counter,1);
call setCounter(@counter,5);

select @counter;