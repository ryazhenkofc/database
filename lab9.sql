-- 1.
CREATE OR REPLACE PROCEDURE increase_value(
    INOUT input_value INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    input_value := input_value + 10;
END;
$$;

-- 2.
CREATE OR REPLACE PROCEDURE compare_nums(
    IN num1 INTEGER,
    IN num2 INTEGER,
    OUT result VARCHAR(10)
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF num1 > num2 THEN
        result := 'Greater';
    ELSIF num1 = num2 THEN
        result := 'Equal';
    ELSE
        result := 'Lesser';
    END IF;
END;
$$;

-- 3.
CREATE OR REPLACE PROCEDURE nums_series(
    IN n INTEGER,
    OUT series TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    i INTEGER;
BEGIN
    series := '';
    FOR i IN 1..n LOOP
        series := series || i || ' ';
    END LOOP;
    series := TRIM(series);
END;
$$;

-- 4.
CREATE OR REPLACE PROCEDURE find_employee(
    IN employee_name VARCHAR(100),
    OUT employee_details REFCURSOR
)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN employee_details FOR 
    SELECT * FROM employees 
    WHERE name = employee_name;
END;
$$;

-- 5.
CREATE OR REPLACE PROCEDURE list_products(
    IN category_name VARCHAR(100),
    OUT product_list REFCURSOR
)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN product_list FOR
    SELECT * FROM products
    WHERE category = category_name;
END;
$$;

-- 6.1
CREATE OR REPLACE PROCEDURE calculate_bonus(
    IN employee_id INTEGER, 
    OUT bonus NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    current_salary NUMERIC;
BEGIN
    SELECT salary INTO current_salary 
    FROM employees 
    WHERE id = employee_id;
    
    bonus := current_salary * 0.1;
END;
$$;

-- 6.2
CREATE OR REPLACE PROCEDURE update_salary(
    IN employee_id INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    employee_bonus NUMERIC;
BEGIN
    CALL calculate_bonus(employee_id, employee_bonus);
    
    UPDATE employees
    SET salary = salary + employee_bonus
    WHERE id = employee_id;
END;
$$;

-- 7.
CREATE OR REPLACE PROCEDURE complex_calculation(
    IN input_number INTEGER,
    IN input_string VARCHAR(100),
    OUT final_result TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE
    string_result VARCHAR(200);
    number_result INTEGER;
BEGIN
    << string_block >>
    DECLARE
        modified_string VARCHAR(200);
    BEGIN
        modified_string := UPPER(input_string) || ' processed';
        string_result := modified_string;
    END string_block;

    << number_block >>
    DECLARE
        processed_number INTEGER;
    BEGIN
        processed_number := input_number * 2 + 10;
        number_result := processed_number;
    END number_block;

    final_result := string_result || ' - ' || number_result;
END;
$$;
