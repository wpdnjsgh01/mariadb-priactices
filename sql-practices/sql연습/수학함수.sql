-- 함수: 수학

-- abs
select abs(-1), abs(1);

-- mod
select mod(10, 3);

-- floor
select floor(3.14);

-- ceil
select ceil(3.14);
select ceiling(3.14);

-- round(x) : x에 가장 근접한 정수
-- round(x, d): x값 중에 소수점 d자리에 가장 근접한 실수
select round(1.498), round(1.498, 1), round(1.498, 0);
 
-- pow(x, y), power(x, y) x의 y승
select pow(2, 10), power(10, 2);

-- sign(x)
select sign(20), sign(-100), sign(0);

-- greatest(x, y, .....), least(x, y, ....)
select greatest(10, 40, 20, 30), least(10, 40, 20, 30);
select greatest('b', 'A', 'C'), greatest('hello', 'hellp', 'hellq');
