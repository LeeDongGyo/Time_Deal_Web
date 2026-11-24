-- 화면 확인용 샘플 상품 30개와 타임딜을 Supabase에 추가합니다. (seed.sql 이후 실행)
-- 이미지는 frontend/public/images/<id>.jpeg (출처: CREDITS.md) 입니다. 다시 실행해도 안전하며 딜 기간이 갱신됩니다.
-- 이전 버전에서 넣었던 사진 없는 10개 상품을 정리합니다(딜은 cascade로 함께 삭제).
delete from public.products where id in ('broccoli','chicken','squid','sandwich','pasta','olive-oil','soy-sauce','water','wet-wipes','shampoo');
insert into public.products(id, name, description, category, image, regular_price, inventory, status) values
('apple-3kg', '청송 사과 3kg', '아삭하고 달콤한 청송 사과입니다.', '채소·과일', 'apple-3kg.jpeg', 29000, 32, 'active'),
('banana', '필리핀 바나나 1송이', '부드럽고 달콤한 바나나 한 송이.', '채소·과일', 'banana.jpeg', 5900, 34, 'active'),
('grape-shine', '샤인머스캣 2송이', '향긋한 국산 샤인머스캣입니다.', '채소·과일', 'grape-shine.jpeg', 24000, 131, 'active'),
('tangerine', '제주 감귤 3kg', '새콤달콤한 제주 노지 감귤.', '채소·과일', 'tangerine.jpeg', 19800, 128, 'active'),
('watermelon', '고창 수박 1통', '시원하고 달콤한 수박 한 통.', '채소·과일', 'watermelon.jpeg', 22000, 35, 'active'),
('tomato', '대저 짭짤이 토마토 1kg', '짭짤하고 진한 맛의 토마토.', '채소·과일', 'tomato.jpeg', 15900, 76, 'active'),
('carrot', '흙당근 1kg', '달큰한 제주 흙당근.', '채소·과일', 'carrot.jpeg', 4900, 98, 'active'),
('pork-belly', '국내산 삼겹살 600g', '구이용 두툼한 한돈 삼겹살.', '신선식품', 'pork-belly.jpeg', 19800, 68, 'active'),
('hanwoo', '1++ 한우 등심 300g', '마블링 좋은 한우 등심.', '신선식품', 'hanwoo.jpeg', 54000, 36, 'active'),
('salmon', '노르웨이 생연어 300g', '회·스테이크용 생연어.', '신선식품', 'salmon.jpeg', 18900, 112, 'active'),
('shrimp', '흰다리새우 500g', '탱글한 냉동 흰다리새우.', '신선식품', 'shrimp.jpeg', 14900, 82, 'active'),
('mackerel', '순살 고등어 4팩', '가시 없는 노르웨이 고등어.', '신선식품', 'mackerel.jpeg', 12900, 146, 'active'),
('croissant', '버터 크루아상 4입', '프랑스 버터로 구운 크루아상.', '베이커리·델리', 'croissant.jpeg', 8900, 107, 'active'),
('bagel', '플레인 베이글 4입', '쫀득한 식사용 베이글.', '베이커리·델리', 'bagel.jpeg', 7500, 39, 'active'),
('bread', '우유 식빵', '촉촉한 우유 식빵 한 봉.', '베이커리·델리', 'bread.jpeg', 4500, 100, 'active'),
('cake', '딸기 생크림 케이크', '생딸기를 올린 조각 케이크 2입.', '베이커리·델리', 'cake.jpeg', 9800, 136, 'active'),
('salad', '닭가슴살 샐러드', '신선 채소와 닭가슴살 샐러드.', '베이커리·델리', 'salad.jpeg', 6900, 134, 'active'),
('cookie', '초코칩 쿠키 6입', '바삭한 수제 초코칩 쿠키.', '베이커리·델리', 'cookie.jpeg', 6500, 25, 'active'),
('kimchi-stew', '김치찌개 밀키트 2인', '묵은지로 끓이는 김치찌개.', '간편식·밀키트', 'kimchi-stew.jpeg', 11900, 49, 'active'),
('tteokbokki', '국물 떡볶이 2인', '달콤매콤 국물 떡볶이.', '간편식·밀키트', 'tteokbokki.jpeg', 7900, 93, 'active'),
('fried-rice', '새우 볶음밥 3봉', '전자레인지 냉동 볶음밥.', '간편식·밀키트', 'fried-rice.jpeg', 8900, 91, 'active'),
('dumpling', '왕교자 만두 1kg', '육즙 가득 왕교자.', '간편식·밀키트', 'dumpling.jpeg', 10900, 126, 'active'),
('pizza', '냉동 페퍼로니 피자', '에어프라이어 페퍼로니 피자.', '간편식·밀키트', 'pizza.jpeg', 9500, 41, 'active'),
('ramen', '얼큰 라면 5입', '얼큰한 국물 라면 묶음.', '면·양념·오일', 'ramen.jpeg', 4980, 79, 'active'),
('rice', '신동진 쌀 10kg', '갓 도정한 신동진 쌀.', '면·양념·오일', 'rice.jpeg', 36900, 33, 'active'),
('orange-juice', '착즙 오렌지주스 1L', '100% 착즙 오렌지주스.', '음료·우유', 'orange-juice.jpeg', 6900, 122, 'active'),
('coffee', '콜드브루 원액 500ml', '진한 콜드브루 커피 원액.', '음료·우유', 'coffee.jpeg', 11900, 132, 'active'),
('yogurt', '그릭 요거트 4입', '꾸덕한 무가당 그릭요거트.', '음료·우유', 'yogurt.jpeg', 8900, 33, 'active'),
('cheese', '슬라이스 치즈 20매', '샌드위치용 체다 치즈.', '음료·우유', 'cheese.jpeg', 7900, 45, 'active'),
('dish-soap', '주방세제 리필 1.2L', '순한 식물성 주방세제.', '생활용품·뷰티', 'dish-soap.jpeg', 6900, 73, 'active')
on conflict(id) do update set name=excluded.name, description=excluded.description, category=excluded.category, image=excluded.image, regular_price=excluded.regular_price, status='active';

insert into public.deals(id, product_id, deal_price, participants, target, starts_at, ends_at, status) values
('deal-apple-3kg', 'apple-3kg', 20300, 7, 15, now(), now() + interval '23 days', 'active'),
('deal-banana', 'banana', 3500, 4, 30, now(), now() + interval '14 days', 'active'),
('deal-grape-shine', 'grape-shine', 19200, 1, 15, now(), now() + interval '5 days', 'active'),
('deal-tangerine', 'tangerine', 14800, 4, 10, now(), now() + interval '5 days', 'active'),
('deal-watermelon', 'watermelon', 13200, 4, 30, now(), now() + interval '10 days', 'active'),
('deal-tomato', 'tomato', 12700, 13, 30, now(), now() + interval '4 days', 'active'),
('deal-carrot', 'carrot', 3600, 9, 15, now(), now() + interval '6 days', 'active'),
('deal-pork-belly', 'pork-belly', 15800, 2, 15, now(), now() + interval '21 days', 'active'),
('deal-hanwoo', 'hanwoo', 37800, 9, 10, now(), now() + interval '25 days', 'active'),
('deal-salmon', 'salmon', 13200, 19, 25, now(), now() + interval '17 days', 'active'),
('deal-shrimp', 'shrimp', 10400, 13, 15, now(), now() + interval '8 days', 'active'),
('deal-mackerel', 'mackerel', 7700, 10, 30, now(), now() + interval '19 days', 'active'),
('deal-croissant', 'croissant', 5300, 14, 30, now(), now() + interval '8 days', 'active'),
('deal-bagel', 'bagel', 4800, 14, 25, now(), now() + interval '4 days', 'active'),
('deal-bread', 'bread', 3600, 26, 30, now(), now() + interval '29 days', 'active'),
('deal-cake', 'cake', 6800, 16, 20, now(), now() + interval '21 days', 'active'),
('deal-salad', 'salad', 4100, 19, 20, now(), now() + interval '24 days', 'active'),
('deal-cookie', 'cookie', 4500, 22, 25, now(), now() + interval '14 days', 'active'),
('deal-kimchi-stew', 'kimchi-stew', 8900, 6, 20, now(), now() + interval '22 days', 'active'),
('deal-tteokbokki', 'tteokbokki', 5900, 4, 10, now(), now() + interval '27 days', 'active'),
('deal-fried-rice', 'fried-rice', 5300, 8, 15, now(), now() + interval '15 days', 'active'),
('deal-dumpling', 'dumpling', 7000, 18, 25, now(), now() + interval '11 days', 'active'),
('deal-pizza', 'pizza', 6600, 8, 25, now(), now() + interval '7 days', 'active'),
('deal-ramen', 'ramen', 3200, 4, 15, now(), now() + interval '24 days', 'active'),
('deal-rice', 'rice', 29500, 11, 30, now(), now() + interval '7 days', 'active'),
('deal-orange-juice', 'orange-juice', 5100, 8, 10, now(), now() + interval '23 days', 'active'),
('deal-coffee', 'coffee', 7100, 2, 15, now(), now() + interval '9 days', 'active'),
('deal-yogurt', 'yogurt', 5700, 6, 10, now(), now() + interval '22 days', 'active'),
('deal-cheese', 'cheese', 4700, 3, 10, now(), now() + interval '20 days', 'active'),
('deal-dish-soap', 'dish-soap', 4800, 1, 30, now(), now() + interval '5 days', 'active')
on conflict(id) do update set deal_price=excluded.deal_price, starts_at=excluded.starts_at, ends_at=excluded.ends_at, status='active';

-- 기존 6개 딜 기간이 지났다면 함께 연장합니다.
update public.deals set status='active', starts_at=now(), ends_at=now() + interval '30 days'
where id in ('deal-eggs-30','deal-strawberry-2','deal-tissue-32','deal-milk-6','deal-detergent-set','deal-grocery-box');
