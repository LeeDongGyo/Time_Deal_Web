-- 장바구니 주문에 필요한 픽업 장소·수령 슬롯과 상품 판매자를 채웁니다. 다시 실행해도 안전합니다.

-- 1. 픽업 장소 3곳
insert into public.pickup_locations(id, name, address, description, is_active) values
('11111111-1111-4111-8111-000000000001', '성수 GS25 성수역점', '서울 성동구 성수이로 20', '성수역 3번 출구 앞, 매장 냉장고 픽업', true),
('11111111-1111-4111-8111-000000000002', '뚝섬 이마트24 서울숲점', '서울 성동구 왕십리로 83', '서울숲역 5번 출구, 계산대에서 주문번호 확인', true),
('11111111-1111-4111-8111-000000000003', '건대 CU 건대입구점', '서울 광진구 아차산로 200', '건대입구역 2번 출구, 픽업 전용 선반', true)
on conflict(id) do update set name=excluded.name, address=excluded.address, description=excluded.description, is_active=true;

-- 2. 오늘부터 14일간, 장소마다 하루 3개 수령 슬롯(서울 시간)
insert into public.pickup_slots(location_id, pickup_date, start_time, end_time, pickup_at, capacity, is_active)
select l.id, d::date, t.s, t.e, (d::date + t.s) at time zone 'Asia/Seoul', 30, true
from public.pickup_locations l
cross join generate_series((now() at time zone 'Asia/Seoul')::date, (now() at time zone 'Asia/Seoul')::date + 13, interval '1 day') d
cross join (values (time '10:00', time '12:00'), (time '14:00', time '16:00'), (time '18:00', time '21:00')) t(s, e)
where l.id in ('11111111-1111-4111-8111-000000000001','11111111-1111-4111-8111-000000000002','11111111-1111-4111-8111-000000000003')
  and not exists (select 1 from public.pickup_slots x where x.location_id = l.id and x.pickup_date = d::date and x.start_time = t.s);

-- 3. 판매자가 없는 상품은 주문이 막히므로(create_order_atomic), 첫 판매자 계정을 판매자로 지정합니다.
update public.products
set seller_id = (select id from public.profiles where role = 'seller' order by created_at limit 1)
where seller_id is null and exists (select 1 from public.profiles where role = 'seller');
