SELECT service, service_addr
FROM public.carcar_service;

-- В качестве уникального идентификатора используем w_phone работника в сервисе

-- Заполняем пустые ячейки поля service
WITH DistinctService AS (
	SELECT w_phone, service
	FROM carcar_service
	WHERE w_phone IS NOT NULL
	AND service IS NOT NULL
	GROUP BY w_phone, service
)
UPDATE public.carcar_service AS cs
SET service = ds.service
FROM DistinctService AS ds
WHERE cs.w_phone = ds.w_phone;

-- Заполняем пустые ячейки поля service_addr
WITH DistinctService AS (
	SELECT w_phone, service_addr
	FROM carcar_service
	WHERE w_phone IS NOT NULL
	AND service_addr IS NOT NULL
	GROUP BY w_phone, service_addr
)
UPDATE public.carcar_service AS cs
SET service_addr = ds.service_addr
FROM DistinctService AS ds
WHERE cs.w_phone = ds.w_phone;

-- Создаем отдельную таблицу services
CREATE TABLE IF NOT EXISTS public.services(
	service_id integer primary key generated by default as identity, -- для гибкости
	service text,
	service_address text
);

-- Заполняем таблицу уникальными значениями
INSERT INTO public.services (service, service_address)
SELECT DISTINCT service, service_addr
FROM public.carcar_service
ORDER BY service, service_addr;

-- Проверка
SELECT service_id, service, service_address
FROM public.services;
