create table carcar_service(
    date date,
    service text,
    service_addr text,
    w_name text,
    w_exp text,
    w_phone text,
    wages integer,
    card text,
    payment text,
    pin text,
    name text,
    phone text,
    email text,
    password text,
    car text,
    mileage integer,
    vin text,
    car_number text,
    color text
);
-- date,service,service_addr,w_name,w_exp,w_phone,wages,card,payment,pin,name,phone,email,password,car,mileage,vin,car_number,color

-- если возникает ошибка на копирование файла из-за отсутствия доступа к директории:
-- прописать в файле пользователя postgres или Network Service, смотря кого найдет

COPY carcar_service(date,service,service_addr,w_name,w_exp,w_phone,wages,card,payment,pin,name,phone,email,password,car,mileage,vin,car_number,color)
FROM 'C:\Users\denis\DB\48e0a9da-1eb2-4421-b967-5b81c40e74ff.csv'
DELIMITER ','
CSV HEADER;
