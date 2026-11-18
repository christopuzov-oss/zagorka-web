---
name: "aiko-video"
description: "Прави видео реклами за AIKO XXXL (мебели) в Creative Claw: сценарий, кинематография, задължителни бранд елементи, генериране и сглобяване. Ползвай при всяко ново видео за Аико."
---

# AIKO XXXL – видео скил

Всяко видео за Аико минава през тези стъпки в този ред. Не пропускай одобренията – генерирането на видео струва кредити.
Отговаряй на потребителя на български. Промптовете към моделите пиши на английски.

## 0. Задължителен бриф (питай само за липсващото)

| Атрибут | Пример / default |
|---|---|
| Продукт(и) | диван Пиза букле, маса Ина, стол Мелиса… (име + цвят) |
| Референтни снимки на продукта | задължително реални каталожни снимки (front, angle, texture). Без снимка → искай качване |
| Формат на видеото | един от форматите в т.1 |
| Повод / кампания | редовна, Коледа, Black Friday, промо % |
| Платформа и съотношение | 9:16 (TikTok/Reels/Stories) default; 16:9 за YouTube/дисплей; 1:1 при нужда |
| Дължина | 15 s default (≈12 s тяло + 3 s endcard) |
| Оферта / текст върху видеото | цена, %, срок – само ако е дадена, никога не измисляй цени |
| CTA | „aiko.bg“ / „24/7 онлайн“ default |

## 1. Формати (доказани до момента)

**A. Magic Unboxing (хит формат)** – кашон с лого AIKO XXXL в празна стая трепери, отваря се и всички мебели излитат от него и застават по местата си → завършена стая.
- Тръгва се ОТЗАД: крайният кадър е реална снимка на обзаведената стая (каталог). С `image/nano-banana-2` се прави начален кадър: същата стая празна + кашон с логото (виж промпт шаблон).
- Видео: `video/minimax-h3-max` (финал), `minimax-h3-max-turbo` за чернови, 12 s, start frame = празна стая с кашон, end frame = реалната снимка.

**B. Locked-off Time-lapse / Lifestyle (3 кадъра)** – 1) макро на текстурата (плат, дърво) с бавен push-in; 2) wide, камерата неподвижна, времето/сезоните минават, светлината се сменя, лампите светват; 3) същият кадър – човек влиза и използва продукта (сгушва се с книга).
- `video/seedance-2.5` (480p за преглед, 720p/1080p финал), филмов проект с `create_film_project`.

**C. Сезонна / празнична кампания (Коледа и др.)** – започва от детайл (подарък, украса) и разкрива каталожната стая. Референция: `aiko-koleda-15s-reference`.

**D. Product hero** – един продукт, 2–4 кадъра: детайл → функция (напр. разтегателна маса затворена→отворена) → в интериор.

Ако потребителят не каже формат – предложи 2 от тях с по едно изречение защо.

## 2. Задължителна кинематография

Всеки кадър в сценария ТРЯБВА да има:
- **План**: macro / close-up / medium / wide
- **Камера**: locked-off (default за A и B) / slow push-in / slow dolly / orbit – по едно движение на кадър, никога ръчна камера
- **Обектив**: wide 24mm за стая, 50mm за продукт, 100mm macro за текстура
- **Светлина**: топла златна следобедна / мека утринна дневна / вечерна с лампи и свещи – винаги топли, уютни тонове
- **Тайминг по секунди** (0–1 s, 1–2 s…) в промпта
- **Звук**: ASMR/foley (картон, щракане на дърво, „fwoomp“), room tone; музика само ако е поискана
- **Вертикален кадър**: важното в средната третина, горе и долу оставяй място за overlay

Стандартни ограничения, които винаги влизат в промпта:
`Cinematic, photorealistic. Clean and crisp: no dust, no smoke, no mist, no haze, no particles. No people (освен ако кадърът ги изисква), no text overlays, no music.`

## 3. Научени правила (от предишните версии – спазвай)

- Кашонът е ЕДИНСТВЕНИЯТ източник: `each piece visibly comes out of the open box… Nothing enters from the edges of the frame, nothing drops from above, nothing appears out of thin air.`
- Първо стенните елементи (ТВ шкаф, рафтове, витрини), после диваните/килима/масата, накрая декорацията – иначе стените остават празни.
- Кашонът трябва да изчезне ясно (сгъва се и се плъзга под масата или се скрива зад падащите дивани). Да НЯМА кашон в крайния кадър.
- Кашонът – среден, по-широк отколкото висок (като кашон за мебели), логото отпред, четливо.
- Без прах/дим – моделите ги добавят и разваля кадъра.
- Продуктите не се преработват: формата, цветът и тапицерията са като на реалната снимка. Подавай снимките като `image_urls` референции.
- Времевите сегменти завършват с 2–4 s „всичко застава, движението спира“ – това е кадърът под endcard-а.

## 4. Задължителни бранд елементи

**Лого – ВИНАГИ само официалното от SVG** (`aiko-logo-official`, векторно, чисти ръбове, прозрачен фон, 2100×740):
`https://cdn.creativeclaw.co/u/734b877d/images/b746684e-d6ae-41fb-92d7-e644f64f49b2.png`
- В HTML композиции може и inline SVG (viewBox `0 0 103 35`, червено `#ED111C`).
- НИКОГА не ползвай старите растерни лога (`aiko-logo`, `aiko-logo-transparent-4x*`) – лошо изрязани. Никога не прерисувай логото от текст или с AI.
- За image edit (лого върху кашон и т.н.) подавай същия официален PNG като референция.

**Цветове**: AIKO червено `#ED111C` (от SVG), бяло, черно. Интериорите – топли неутрални (беж, дъб, сиво, зелен акцент).

**Слоган**: „КЪДЕТО ИМА ВСИЧКО“ – бели главни, Montserrat 500 (НЕ тънък), с мека тъмна сянка, широк колкото червения правоъгълник на логото, центриран под него.

**Overlay през цялото видео** (`aiko-overlay-24-7-v2`): горе вляво червена карта „Aiko XXXL / ONLINE“ + „24/7 aiko.bg“, лого горе вдясно.
`https://cdn.creativeclaw.co/u/734b877d/images/be29bc73-a7ee-4239-a20b-727014e2bce0.png`

**Endcard – анимиран, никога статична картинка с рязък срез.** Прави се с `render_html_video` (HyperFrames) върху тялото. Референтна версия: `aiko-divan-16s-16x9-v6`.
- от ~11.4 s: последният кадър се размазва (blur 0→20px, brightness 0.84, scale 1→1.05, ~2.2 s, sine.inOut), след това много бавен push до края;
- overlay-ят избледнява (~1 s); червена рамка 16px `#ED111C` се появява (~1.2 s);
- официално лого (~1100px широко при 1920) + слоган изплуват заедно (opacity, scale 0.95→1, ~1.4 s), после бавно scale до 1.035 – кадърът не замръзва;
- звукът на последния кадър заглъхва (~1.6 s), не се реже;
- поне ~2.5 s задържане на логото (общо ~16 s).

**⛔ ENDCARD – ЖЕЛЕЗНИ ПРАВИЛА (клиентът ги хвана на 5 видеа – излагаме се, не се повтаря):**
Бенчмарк = финалът на диваните (`aiko-divan-16s-16x9-v6`): под блъра видеото ПРОДЪЛЖАВА да тече плавно до последния кадър.
1. **Никога замръзнал кадър под блъра.** Забранено: still от последния кадър като фон, „freeze frame“, задържане на последен кадър от `stitch_clips`/`compose_video`. (Грешки: спални – замръзва ~2 s; детски стаи – замръзва.)
   - Endcard-ът започва ВЪТРЕ в клипа (последните ~3 s от тялото текат под блъра), не след края му.
   - Ако клипът е твърде къс за целия endcard → забави опашката му (напр. последните 1.5 s на 0.5x, плавно) или вземи по-ранен старт на endcard-а. Никога freeze.
   - При генериране планирай клипа с ≥3 s „успокояващо се“ движение в края (бавно движение, не пълна статика), за да има какво да тече под блъра.
2. **Червената рамка е статична.** Появява се с opacity (fade ~0.5–1.2 s) и стои с ЕДНАКВА дебелина и позиция до последния кадър. Никакво свиване, мащабиране, анимиране на inset/border в последната секунда. Рамката НЕ участва в общия scale/push на кадъра – слага се в отделен слой над него. (Грешки: офиси 6 s и 15-секундното – рамката се свива накрая.)
3. **Червената рамка е задължителна на ВСЕКИ endcard**, 16px `#ED111C` при 1920 (пропорционално при други размери). (Грешка: килими – без рамка.)
4. **Задължителна проверка преди предаване:** `extract_frames` с timestamps на последните 3 s през 0.25 s (напр. T-3, T-2.75 … T-0.05) и сравни:
   - фонът под блъра се променя между кадрите (иначе = freeze → поправи);
   - рамката е на едно и също място и със същата дебелина във всеки кадър (иначе = свиване → поправи);
   - рамката я има.
   Ако някое не е изпълнено – видеото НЕ се предава.

**„Създадено с ИИ“** (точно така изписано) – ЗАДЪЛЖИТЕЛНО долу вдясно през цялото видео: бял Montserrat 500, ~20px при 1080p, полупрозрачна тъмна плочка (padding 7/14px, радиус 6px), отстъп ~48/40px.

**Overlay – бележка:** текущият overlay е твърде блед върху светли кадри. При нови видеа го прави в HTML: плътна червена карта, бял болд текст „24/7 aiko.bg“ със сянка, официалното лого горе вдясно.

Преди нова работа провери `search_assets({query:"aiko"})` за по-нови версии на overlay/endcard/лого и ползвай последната.

## 5. Работен процес

1. **Бриф** (т.0) → провери библиотеката за продуктови снимки и бранд асети.
2. **Сценарий** – таблица: # | секунди | план | камера/обектив | действие | светлина | звук | текст на екрана. Плюс logline в едно изречение. → **ОДОБРЕНИЕ**.
3. **Ключови кадри** с `image/nano-banana-2` (start/end frames, празна стая с кашон и т.н.). Покажи ги. → **ОДОБРЕНИЕ**.
4. **Чернова** – евтин модел/480p (`minimax-h3-max-turbo` или `seedance-2.5` 480p). Покажи. → **ОДОБРЕНИЕ** или корекции по т.3.
5. **Финал** – пълно качество; за многокадрови → `create_film_project` + `assemble_film`.
6. **Сглобяване**: тяло + overlay + endcard + звук (foley/музика) → 15 s, правилно съотношение. Надписи само ако има говор.
7. **Проверка** преди предаване (extract_frames timeline): официалното лого, чисто; продуктът съвпада със снимката; няма кашон/прах/артефакти в края; **хората влизат в кадър от ръба – никога не режи влизането, за да не „изскачат“**; endcard с плавен преход и заглъхващ звук; „Създадено с ИИ“ изписано правилно; правопис на всеки български надпис; дължина и съотношение. После дай линк.

Именуване на асетите: `aiko-<продукт>-<формат>-<версия>` (напр. `aiko-piza-unboxing-v3`), тагове `aiko` + продукт.

## 6. Шаблони за промптове

**Празна стая + кашон (nano-banana-2, image_urls = [крайна снимка, лого])**
```
Edit this photo: remove ALL furniture and objects — <списък>. Keep the empty architecture exactly the same: same camera angle and <vertical/horizontal> framing, same walls, floor, window, ceiling and light. Then place one medium-sized sealed brown cardboard furniture box (wider than tall) on the floor in the lower middle of the frame, front facing the camera. On its front print the logo from the second reference image exactly: red rectangle with white lowercase "aiko" and the small tilted white tag with black "XXX" and red "L". Logo sharp and readable. Photorealistic, no people, no other text.
```

**Magic Unboxing видео (12 s)**
```
Cinematic, photorealistic magic furniture unboxing in <light>, cosy warm tones. Single fixed wide-angle shot; the camera does not move at all. The cardboard box with the red "aiko XXXL" logo is the ONLY source of every object: each piece visibly comes out of the open box, flies up in a smooth arc and lands exactly in its place in the final room. Nothing enters from the edges, nothing drops from above, nothing appears out of thin air. Clean and crisp: no dust, no smoke, no mist, no haze, no particles.
0-1s: sealed box trembles; soft low rumble.
1-1.8s: flaps snap open upward; cardboard pop.
1.8-4.5s: wall pieces first: <...>.
4.5-6.5s: <sofas, rug, table>.
6.5-7.5s: last: <decor>.
7.5-8.5s: empty box folds flat and slides away, gone.
8.5-12s: finished room rests, everything settles exactly into the final arrangement, all motion stops; quiet room tone.
Fast satisfying whirring, clicking and wood-snapping sounds. No people, no text overlays, no music.
```

**Time-lapse кадър (seedance-2.5)**
```
Locked-off wide shot, 24mm, of <room> with <product>. Time-lapse: <morning sun shadows sweep across the room → seasons outside → dusk>, the floor lamp and candles light up. The product stays perfectly still and identical. Photorealistic, warm cosy tones, no text, no music, quiet room tone.
```