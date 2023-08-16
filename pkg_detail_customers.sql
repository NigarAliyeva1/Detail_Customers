create or replace package pkg_detail_customers as
procedure add_detail_customer
(p_first_name detail_customers.first_name%type,
p_last_name detail_customers.last_name%type,
p_email detail_customers.email%type);
end;

/

create or replace package body pkg_detail_customers as
procedure add_detail_customer
(p_first_name detail_customers.first_name%type,
p_last_name detail_customers.last_name%type,
p_email detail_customers.email%type) 
is 
 e_first_name_outof_range exception;
begin 
        if length(p_first_name)>30 then
        raise e_first_name_outof_range;
        end if;

    --insert data
    insert into detail_customers(first_name,last_name,email)
    values(p_first_name,p_last_name,p_email);
    commit;
exception
    when no_data_found then
    dbms_output.put_line('missing data');
     when e_first_name_outof_range then
    dbms_output.put_line('30 simvoldan uzundur');
     when others then
    dbms_output.put_line('Invalid');
    

end add_detail_customer;
   
end pkg_detail_customers;

/
