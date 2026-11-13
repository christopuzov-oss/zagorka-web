// Генерира 3 варианта на постера (1080x1350) като HTML и PNG.
const fs = require('fs');
const path = require('path');
const { chromium } = require('playwright');

const OUT = __dirname;
const b64 = f => 'data:image/png;base64,' + fs.readFileSync(path.join(OUT, 'assets', f)).toString('base64');
const USYC = b64('usyc.png');
const AIKO = b64('aiko.png');

const TF = process.env.TFONT || 'Pacifico';
const UPPER = process.env.TUPPER === '1';
const TSCALE = parseFloat(process.env.TSCALE || '1');
const TAG = process.env.TAG || '';
const T1 = UPPER ? 'КОЛЕДЕН' : 'Коледен', T2 = UPPER ? 'КОКТЕЙЛ' : 'коктейл';
const FONTS = `<link href="https://fonts.googleapis.com/css2?family=${TF.replace(/ /g, '+')}&family=Nunito:wght@500;600;700;800&display=swap" rel="stylesheet">`;

/* ---------- Мечето (viewBox 0 0 400 470) ---------- */
function bear(p = {}) {
  const c = Object.assign({
    fur: '#C58A4E', furDark: '#A86F38', furLight: '#E7C08C', pad: '#F0D3A6',
    nose: '#3B2418', hat: '#C3272F', hatDark: '#9E1C24', trim: '#FFF8EC',
    scarf: '#1F5A41', scarfDark: '#17452F', cap: '#1E2430', capLight: '#333C4D', gold: '#E2B659',
    shadow: 'rgba(40,10,5,.35)', id: 'b'
  }, p);
  const sh = `filter="url(#${c.id}sh)"`;
  return `
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 470" class="bear">
  <defs>
    <filter id="${c.id}sh" x="-20%" y="-20%" width="140%" height="140%">
      <feDropShadow dx="0" dy="5" stdDeviation="5" flood-color="${c.shadow}"/>
    </filter>
    <filter id="${c.id}grain" x="0" y="0" width="100%" height="100%">
      <feTurbulence type="fractalNoise" baseFrequency="1.1" numOctaves="2" seed="7" result="n"/>
      <feColorMatrix in="n" type="matrix" values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 -1.1 .62" result="a"/>
      <feComposite in="a" in2="SourceGraphic" operator="in" result="g"/>
      <feBlend in="SourceGraphic" in2="g" mode="multiply"/>
    </filter>
    <radialGradient id="${c.id}fur" cx="45%" cy="35%" r="75%">
      <stop offset="0" stop-color="${c.furLight}" stop-opacity=".55"/>
      <stop offset=".6" stop-color="${c.fur}" stop-opacity="0"/>
    </radialGradient>
  </defs>
  <g filter="url(#${c.id}grain)">
  <!-- крака -->
  <g ${sh}>
    <ellipse cx="104" cy="408" rx="60" ry="46" fill="${c.furDark}"/>
    <ellipse cx="296" cy="408" rx="60" ry="46" fill="${c.furDark}"/>
  </g>
  <!-- тяло -->
  <g ${sh}>
    <ellipse cx="200" cy="318" rx="112" ry="118" fill="${c.fur}"/>
    <ellipse cx="200" cy="318" rx="112" ry="118" fill="url(#${c.id}fur)"/>
    <ellipse cx="200" cy="345" rx="70" ry="76" fill="${c.furLight}" opacity=".75"/>
  </g>
  <!-- стъпала -->
  <g ${sh}>
    <ellipse cx="98" cy="414" rx="50" ry="40" fill="${c.fur}"/>
    <ellipse cx="302" cy="414" rx="50" ry="40" fill="${c.fur}"/>
    <ellipse cx="94" cy="418" rx="27" ry="22" fill="${c.pad}"/>
    <ellipse cx="306" cy="418" rx="27" ry="22" fill="${c.pad}"/>
    <g fill="${c.pad}"><circle cx="66" cy="390" r="7"/><circle cx="88" cy="382" r="7.5"/><circle cx="112" cy="386" r="7"/>
    <circle cx="288" cy="386" r="7"/><circle cx="312" cy="382" r="7.5"/><circle cx="334" cy="390" r="7"/></g>
  </g>
  <!-- ръце -->
  <g ${sh}>
    <ellipse cx="104" cy="296" rx="33" ry="60" transform="rotate(-24 104 296)" fill="${c.fur}"/>
    <ellipse cx="296" cy="296" rx="33" ry="60" transform="rotate(24 296 296)" fill="${c.fur}"/>
  </g>
  <!-- абсолвентска шапка -->
  <g ${sh}>
    <path d="M142 330 L142 372 Q200 402 258 372 L258 330 Z" fill="${c.capLight}"/>
    <path d="M200 256 L326 306 L200 358 L74 306 Z" fill="${c.cap}"/>
    <path d="M200 256 L326 306 L200 312 Z" fill="${c.capLight}" opacity=".6"/>
    <circle cx="200" cy="307" r="8" fill="${c.gold}"/>
    <path d="M200 307 Q238 318 246 340 L246 388" fill="none" stroke="${c.gold}" stroke-width="4.5" stroke-linecap="round"/>
    <path d="M237 386 h18 l6 38 h-30 Z" fill="${c.gold}"/>
    <rect x="236" y="381" width="20" height="9" rx="3" fill="#B98E38"/>
  </g>
  <!-- лапи (прегръдка) -->
  <g ${sh}>
    <ellipse cx="96" cy="322" rx="30" ry="26" transform="rotate(-20 96 322)" fill="${c.fur}"/>
    <ellipse cx="304" cy="322" rx="30" ry="26" transform="rotate(20 304 322)" fill="${c.fur}"/>
    <ellipse cx="100" cy="326" rx="15" ry="12" fill="${c.furLight}" opacity=".6"/>
    <ellipse cx="300" cy="326" rx="15" ry="12" fill="${c.furLight}" opacity=".6"/>
  </g>
  <!-- шал -->
  <g ${sh}>
    <path d="M252 232 L290 318 L250 330 L226 246 Z" fill="${c.scarfDark}"/>
    <path d="M254 320 l6 16 M266 317 l6 16 M278 313 l6 16" stroke="${c.scarfDark}" stroke-width="5" stroke-linecap="round"/>
    <path d="M108 214 Q200 262 292 214 L298 246 Q200 300 102 246 Z" fill="${c.scarf}"/>
    <path d="M118 232 Q200 276 282 232" fill="none" stroke="${c.trim}" stroke-width="3" opacity=".45" stroke-dasharray="2 9" stroke-linecap="round"/>
  </g>
  <!-- уши -->
  <g ${sh}>
    <circle cx="122" cy="96" r="40" fill="${c.fur}"/><circle cx="278" cy="96" r="40" fill="${c.fur}"/>
    <circle cx="124" cy="100" r="21" fill="${c.pad}"/><circle cx="276" cy="100" r="21" fill="${c.pad}"/>
  </g>
  <!-- глава -->
  <g ${sh}>
    <ellipse cx="200" cy="158" rx="104" ry="92" fill="${c.fur}"/>
    <ellipse cx="200" cy="158" rx="104" ry="92" fill="url(#${c.id}fur)"/>
  </g>
  <ellipse cx="200" cy="190" rx="46" ry="36" fill="${c.pad}"/>
  <ellipse cx="146" cy="188" rx="17" ry="11" fill="#E8836F" opacity=".45"/>
  <ellipse cx="254" cy="188" rx="17" ry="11" fill="#E8836F" opacity=".45"/>
  <ellipse cx="200" cy="174" rx="15" ry="11" fill="${c.nose}"/>
  <ellipse cx="196" cy="171" rx="5" ry="3" fill="#fff" opacity=".35"/>
  <path d="M200 185 V196 M200 196 Q188 210 177 201 M200 196 Q212 210 223 201" fill="none" stroke="${c.nose}" stroke-width="3.5" stroke-linecap="round"/>
  <circle cx="160" cy="154" r="9.5" fill="${c.nose}"/><circle cx="240" cy="154" r="9.5" fill="${c.nose}"/>
  <circle cx="163" cy="151" r="3" fill="#fff"/><circle cx="243" cy="151" r="3" fill="#fff"/>
  <path d="M144 134 Q158 124 174 132 M226 132 Q242 124 256 134" fill="none" stroke="${c.furDark}" stroke-width="4" stroke-linecap="round"/>
  <!-- коледна шапка -->
  <g ${sh}>
    <path d="M112 100 Q150 4 262 22 Q330 36 344 110 Q318 84 286 86 Q296 96 292 110 Z" fill="${c.hat}"/>
    <path d="M262 22 Q330 36 344 110 Q318 84 286 86 Q300 50 262 22 Z" fill="${c.hatDark}"/>
    <path d="M100 96 Q200 56 298 100 Q306 118 296 132 Q200 92 106 128 Q94 112 100 96 Z" fill="${c.trim}"/>
    <circle cx="346" cy="118" r="21" fill="${c.trim}"/>
  </g>
  </g>
</svg>`;
}

/* ---------- Общи елементи ---------- */
const flake = (x, y, s, col = '#fff', o = 1, rot = 0) => `
<svg style="position:absolute;left:${x}px;top:${y}px;opacity:${o};transform:rotate(${rot}deg)" width="${s}" height="${s}" viewBox="-50 -50 100 100">
  <g stroke="${col}" stroke-width="6" stroke-linecap="round" fill="none">
  ${[0, 60, 120].map(a => `<g transform="rotate(${a})"><path d="M0 -44 V44 M0 -26 l-12 -12 M0 -26 l12 -12 M0 26 l-12 12 M0 26 l12 12"/></g>`).join('')}
  </g></svg>`;

const star = (x, y, s, col = '#E9C46A', o = 1) => `
<svg style="position:absolute;left:${x}px;top:${y}px;opacity:${o}" width="${s}" height="${s}" viewBox="-50 -50 100 100">
  <path d="M0 -48 C4 -12 12 -4 48 0 C12 4 4 12 0 48 C-4 12 -12 4 -48 0 C-12 -4 -4 -12 0 -48Z" fill="${col}"/></svg>`;

function dots(n, seed, col, w = 1080, h = 1350, y0 = 0, maxR = 4) {
  let s = seed; const r = () => (s = (s * 9301 + 49297) % 233280) / 233280;
  let out = '';
  for (let i = 0; i < n; i++) out += `<circle cx="${(r() * w).toFixed(0)}" cy="${(y0 + r() * h).toFixed(0)}" r="${(1 + r() * maxR).toFixed(1)}" opacity="${(.25 + r() * .6).toFixed(2)}"/>`;
  return `<svg style="position:absolute;left:0;top:0" width="1080" height="1350" fill="${col}">${out}</svg>`;
}

function stamp({ ring, text, bg = 'none', size = 210, id = 'st' }) {
  return `
<svg class="stamp" width="${size}" height="${size}" viewBox="-110 -110 220 220">
  <defs><path id="${id}c" d="M0 -78 A78 78 0 1 1 -0.01 -78"/></defs>
  <circle r="106" fill="${bg}" stroke="${ring}" stroke-width="2.5"/>
  <circle r="100" fill="none" stroke="${ring}" stroke-width="1" stroke-dasharray="1.5 5" stroke-linecap="round"/>
  <circle r="60" fill="none" stroke="${ring}" stroke-width="1.5"/>
  <text transform="rotate(-118)" font-family="Nunito" font-weight="800" font-size="15.5" fill="${text}">
    <textPath href="#${id}c" textLength="482" lengthAdjust="spacing">ОПЕРАЦИЯ ПЛЮШЕНО МЕЧЕ · 13.12 ·</textPath></text>
  <!-- мече-икона -->
  <g fill="${text}">
    <circle cx="-26" cy="-24" r="13"/><circle cx="26" cy="-24" r="13"/>
    <ellipse cx="0" cy="4" rx="38" ry="34"/>
  </g>
  <g fill="${bg === 'none' ? '#fff' : bg}">
    <circle cx="-14" cy="-4" r="4"/><circle cx="14" cy="-4" r="4"/>
    <ellipse cx="0" cy="14" rx="14" ry="10"/>
  </g>
  <ellipse cx="0" cy="10" rx="5" ry="3.5" fill="${text}"/>
</svg>`;
}

function logos(fg, sub) {
  return `
<div class="logos">
  <div class="slot"><img src="${USYC}" style="height:118px"></div>
  <div class="sep"></div>
  <div class="slot fnd">
    <span class="f1" style="color:${sub}">ФОНДАЦИЯ</span>
    <span class="f2" style="color:${fg}">Скритите таланти<br>на България</span>
  </div>
  <div class="sep"></div>
  <div class="slot"><img src="${AIKO}" style="height:74px"></div>
</div>`;
}

const GAL = path.join(OUT, 'assets', 'fonts', 'UNIQAGalanoTT-SemiBold.ttf');
const FACE = fs.existsSync(GAL) ? `@font-face{font-family:'UNIQA Galano';src:url(data:font/ttf;base64,${fs.readFileSync(GAL).toString('base64')});font-weight:100 900}` : '';
console.log(FACE ? 'font: UNIQA Galano' : 'font: Montserrat (fallback, Galano file missing)');
const BASE = `${FACE}
:root{--f:Nunito,sans-serif;--t:'${TF.split(':')[0]}',Nunito,sans-serif}

*{box-sizing:border-box;margin:0;padding:0}
html,body{width:1080px;height:1350px;overflow:hidden}
.p{position:relative;width:1080px;height:1350px;overflow:hidden;font-family:var(--f);font-feature-settings:'locl'}
.abs{position:absolute}
.c{position:absolute;left:0;width:1080px;text-align:center}
.title{font-family:var(--t);font-weight:400;line-height:1.08;letter-spacing:0;transform:scale(${TSCALE});transform-origin:50% 40%}
.kicker{font-weight:600;letter-spacing:.42em;font-size:22px;text-transform:uppercase}
.logos{position:absolute;left:0;bottom:0;width:1080px;height:160px;display:flex;align-items:center;justify-content:center;gap:54px}
.logos .slot{display:flex;flex-direction:column;align-items:center;justify-content:center;min-width:250px}
.logos .sep{width:1.5px;height:76px;background:currentColor;opacity:.25}
.fnd{text-align:center}
.fnd .f1{font-size:12.5px;font-weight:700;letter-spacing:.42em;margin-bottom:6px}
.fnd .f2{font-family:var(--f);font-weight:600;font-size:25px;line-height:1.12}
.grain{position:absolute;inset:0;pointer-events:none;mix-blend-mode:multiply;opacity:.5}
`;
const GRAIN = (f = .8, a = .5) => `<svg class="grain" width="1080" height="1350"><filter id="pg"><feTurbulence type="fractalNoise" baseFrequency="${f}" numOctaves="3" seed="3"/><feColorMatrix type="matrix" values="0 0 0 0 .35  0 0 0 0 .25  0 0 0 0 .2  0 0 0 ${a} 0"/></filter><rect width="100%" height="100%" filter="url(#pg)"/></svg>`;

/* ================= A — „Хартиен театър“ (бордо) ================= */
function posterA() {
  const tree = (x, y, w, col, col2, flip) => `
  <svg class="abs" style="left:${x}px;top:${y}px;filter:drop-shadow(0 10px 14px rgba(20,0,0,.45));${flip ? 'transform:scaleX(-1)' : ''}" width="${w}" height="${w * 1.9}" viewBox="0 0 200 380">
    <path d="M100 0 L150 90 L128 90 L170 170 L142 170 L190 260 L156 260 L200 350 L0 350 L44 260 L10 260 L58 170 L30 170 L72 90 L50 90 Z" fill="${col}"/>
    <path d="M100 0 L150 90 L128 90 L170 170 L142 170 L190 260 L156 260 L200 350 L100 350 Z" fill="${col2}" opacity=".55"/>
  </svg>`;
  const cloud = (x, y, flip) => `
  <svg class="abs" style="left:${x}px;top:${y}px;filter:drop-shadow(0 10px 12px rgba(20,0,0,.45));${flip ? 'transform:scaleX(-1)' : ''}" width="420" height="300" viewBox="0 0 420 300">
    <g fill="#2E7B57"><circle cx="40" cy="40" r="150"/><circle cx="210" cy="10" r="110"/><circle cx="330" cy="-10" r="80"/><circle cx="10" cy="210" r="80"/></g>
    <g fill="#1F5F43"><circle cx="20" cy="20" r="120"/><circle cx="180" cy="-10" r="90"/><circle cx="300" cy="-30" r="66"/><circle cx="-10" cy="180" r="64"/></g>
  </svg>`;
  return `<!doctype html><html lang="bg"><head><meta charset="utf-8">${FONTS}<style>${BASE}
  .p{background:#7C1622;color:#FFF4E2}
  .arch{position:absolute;border-radius:500px 500px 0 0;box-shadow:inset 0 14px 30px rgba(30,0,0,.45)}
  .a1{left:50px;top:70px;width:980px;height:1400px;background:#8E1C28}
  .a2{left:110px;top:150px;width:860px;height:1300px;background:#A32431}
  .a3{left:170px;top:232px;width:740px;height:1300px;background:#8A1A27}
  .title{font-size:112px;color:#FFF4E2;text-shadow:0 4px 0 rgba(60,0,0,.35)}
  .globe{position:absolute;left:290px;top:560px;width:500px;height:500px;border-radius:50%;
    background:radial-gradient(circle at 35% 28%,rgba(255,255,255,.34),rgba(255,236,214,.14) 45%,rgba(255,220,200,.08) 70%);
    border:3px solid rgba(255,238,214,.75);box-shadow:0 20px 40px rgba(30,0,0,.4), inset 0 0 50px rgba(255,255,255,.12);overflow:hidden}
  .snow{position:absolute;left:-40px;bottom:-150px;width:580px;height:260px;border-radius:50%;background:#FFF6E6}
  .bear{position:absolute;left:345px;top:590px;width:390px}
  .base{position:absolute;left:350px;top:1032px;width:380px;height:44px;border-radius:14px;background:#C99A4B;box-shadow:0 10px 16px rgba(30,0,0,.4), inset 0 -8px 0 #A87A34}
  .stamp{position:absolute;left:742px;top:560px;transform:rotate(14deg);filter:drop-shadow(0 8px 10px rgba(30,0,0,.4))}
  .band{position:absolute;left:0;bottom:0;width:1080px;height:300px;background:#FBEBCD;box-shadow:0 -10px 24px rgba(30,0,0,.35)}
  .pill{position:absolute;left:190px;top:1068px;width:700px;height:86px;border-radius:44px;
    background:repeating-linear-gradient(-45deg,#B3262E 0 12px,#FFF4E2 12px 24px,#2E7B57 24px 36px,#FFF4E2 36px 48px);padding:7px;box-shadow:0 10px 18px rgba(30,0,0,.35)}
  .pill div{height:100%;border-radius:38px;background:#8E1C28;display:flex;align-items:center;justify-content:center;
    font-family:var(--f);font-weight:600;font-size:36px;letter-spacing:.06em;color:#FFF4E2}
  .cause{top:1166px;color:#6B1420;font-size:17.5px;font-weight:600;letter-spacing:.04em;line-height:1.5}
  .cause b{font-family:var(--f);font-weight:600;font-size:22px;letter-spacing:0}
  .logos{height:122px;color:#6B1420}
  </style></head><body><div class="p">
  <div class="arch a1"></div><div class="arch a2"></div><div class="arch a3"></div>
  ${dots(90, 11, '#FFF4E2', 1080, 1000, 60, 3)}
  ${cloud(-60, -50)}${cloud(720, -50, true)}
  ${star(118, 300, 44)}${star(930, 330, 34)}${star(60, 520, 26, '#FFF4E2')}${star(985, 560, 22, '#FFF4E2')}${star(520, 46, 40)}
  ${flake(120, 640, 86, '#FFF4E2', .95)}${flake(900, 900, 70, '#FFF4E2', .9, 15)}${flake(880, 430, 46, '#F3B9B0', .8)}${flake(215, 930, 44, '#F3B9B0', .8, 20)}
  <div class="c kicker" style="top:176px;font-size:17px;color:#F6D9A8">USYC представя</div>
  <div class="c" style="top:226px"><span style="display:inline-block;padding:9px 26px 9px 34px;border:1.5px solid #E9C46A;border-radius:40px;color:#E9C46A" class="kicker">Благотворителен</span></div>
  <div class="c title" style="top:296px">${T1}<br>${T2}</div>
  <div class="globe"><div class="snow"></div>${dots(46, 5, '#fff', 500, 400, 0, 4).replace('width="1080" height="1350"', 'width="500" height="500"')}</div>
  ${bear({ id: 'a', scarf: '#1F6B4A', scarfDark: '#17523A' })}
  <div class="base"></div>
  ${stamp({ ring: '#7C1622', text: '#7C1622', bg: '#FBEBCD', id: 'sa' })}
  ${tree(-70, 760, 250, '#2E7B57', '#1F5F43')}${tree(-120, 930, 220, '#1F5F43', '#174A35')}
  ${tree(900, 760, 250, '#2E7B57', '#1F5F43', true)}${tree(980, 930, 220, '#1F5F43', '#174A35', true)}
  <div class="band"></div>
  <div class="pill"><div>13.12.2026 · ХОТЕЛ РОСЛИН</div></div>
  <div class="c cause">В подкрепа на <b>Операция Плюшено мече</b> · Фондация Скритите таланти на България</div>
  ${logos('#6B1420', '#A32431')}
  ${GRAIN(.9, .28)}
  </div></body></html>`;
}

/* ================= B — „Акварелна картичка“ (крем) ================= */
function posterB() {
  const flags = ['#B3262E', '#3E7A5A', '#B3262E', '#3E7A5A', '#B3262E', '#3E7A5A', '#B3262E'];
  const bunting = `
  <svg class="abs" style="left:0;top:0;filter:url(#wc)" width="1080" height="240" viewBox="0 0 1080 240">
    <path d="M-10 18 Q540 150 1090 18" fill="none" stroke="#9C7A52" stroke-width="5"/>
    ${flags.map((f, i) => { const t = (i + .5) / flags.length; const x = t * 1080; const y = 18 + 132 * (1 - Math.pow(2 * t - 1, 2)) * .5 * 2 * .5 + 0; const yy = 18 + 66 * (1 - Math.pow(2 * t - 1, 2)) * 1; const ang = (0.5 - t) * -28;
      return `<g transform="translate(${x} ${yy}) rotate(${ang})"><path d="M-58 -4 L58 -4 L0 104 Z" fill="${f}" opacity=".9"/>
      ${i % 2 ? '<g fill="#F7EFE0" opacity=".85"><circle cx="-20" cy="16" r="5"/><circle cx="14" cy="22" r="5"/><circle cx="-4" cy="48" r="5"/><circle cx="24" cy="6" r="4"/></g>' : '<path d="M0 14 l6 14 15 1 -12 10 4 15 -13 -8 -13 8 4 -15 -12 -10 15 -1Z" fill="#F7EFE0" opacity=".9"/>'}</g>`; }).join('')}
  </svg>`;
  const ornament = (x, len, r, col, stripe) => `
  <svg class="abs" style="left:${x - r - 4}px;top:0;filter:url(#wc)" width="${2 * r + 8}" height="${len + 2 * r + 20}">
    <line x1="${r + 4}" y1="0" x2="${r + 4}" y2="${len}" stroke="#8A6B48" stroke-width="2"/>
    <rect x="${r - 5}" y="${len - 4}" width="18" height="12" rx="3" fill="#B08B4F"/>
    <circle cx="${r + 4}" cy="${len + r + 6}" r="${r}" fill="${col}" opacity=".92"/>
    <path d="M${6} ${len + r - 4} Q${r + 4} ${len + r + 10} ${2 * r + 2} ${len + r - 4} M${5} ${len + r + 12} Q${r + 4} ${len + r + 26} ${2 * r + 3} ${len + r + 12}" fill="none" stroke="${stripe}" stroke-width="3" opacity=".8"/>
    <ellipse cx="${r - 8}" cy="${len + r - 8}" rx="${r * .25}" ry="${r * .4}" fill="#fff" opacity=".25" transform="rotate(-30 ${r - 8} ${len + r - 8})"/>
  </svg>`;
  const sprig = (x, y, s, rot, flip) => `
  <svg class="abs" style="left:${x}px;top:${y}px;transform:rotate(${rot}deg) ${flip ? 'scaleX(-1)' : ''};filter:url(#wc)" width="${s}" height="${s}" viewBox="0 0 200 200">
    <path d="M10 190 Q90 110 190 20" fill="none" stroke="#7A5B3A" stroke-width="4" stroke-linecap="round"/>
    ${[0, 1, 2, 3, 4, 5, 6].map(i => { const t = .12 + i * .125; const px = 10 + 180 * t, py = 190 - 170 * t - 20 * Math.sin(t * 3.14);
      return `<g transform="translate(${px} ${py}) rotate(-43)"><ellipse cx="0" cy="-24" rx="9" ry="26" fill="#3E7A5A" opacity=".85" transform="rotate(-38)"/><ellipse cx="0" cy="24" rx="9" ry="26" fill="#56906E" opacity=".8" transform="rotate(38)"/></g>`; }).join('')}
    <g fill="#B3262E"><circle cx="52" cy="160" r="11"/><circle cx="74" cy="168" r="9"/><circle cx="60" cy="140" r="8"/></g>
  </svg>`;
  const gift = (x, y, w, h, col, rib) => `
  <svg class="abs" style="left:${x}px;top:${y}px;filter:url(#wc)" width="${w + 20}" height="${h + 70}" viewBox="-10 -60 ${w + 20} ${h + 70}">
    <rect x="0" y="0" width="${w}" height="${h}" rx="6" fill="${col}" opacity=".92"/>
    <rect x="-6" y="-8" width="${w + 12}" height="30" rx="6" fill="${col}"/>
    <rect x="${w / 2 - 12}" y="-8" width="24" height="${h + 8}" fill="${rib}"/>
    <path d="M${w / 2} -8 C${w / 2 - 60} -70 ${w / 2 - 80} -10 ${w / 2} -8 C${w / 2 + 60} -70 ${w / 2 + 80} -10 ${w / 2} -8Z" fill="${rib}"/>
  </svg>`;
  return `<!doctype html><html lang="bg"><head><meta charset="utf-8">${FONTS}<style>${BASE}
  .p{background:#F6EFE1;color:#6B4A2E}
  .frame{position:absolute;left:36px;top:36px;right:36px;bottom:36px;border:1.5px solid #C9A46A;border-radius:6px;opacity:.7}
  .title{font-size:118px;color:#B3262E;letter-spacing:.03em}
  .t2{color:#7A5B3A;font-weight:500}
  .bear{position:absolute;left:345px;top:560px;width:390px;filter:url(#wc)}
  .wash{position:absolute;left:250px;top:560px;width:580px;height:500px;border-radius:50%;background:radial-gradient(closest-side,rgba(226,170,150,.38),rgba(226,170,150,.14) 60%,rgba(226,170,150,0));filter:url(#wc)}
  .stamp{position:absolute;left:748px;top:600px;transform:rotate(12deg);opacity:.92}
  .date{top:1052px;display:flex;align-items:center;justify-content:center;gap:26px;left:110px;width:860px}
  .date i{flex:1;height:2px;background:#B3262E}
  .date span{font-family:var(--f);font-weight:600;font-size:38px;letter-spacing:.06em;color:#3E7A5A;white-space:nowrap}
  .cause{top:1118px;font-size:17.5px;font-weight:500;letter-spacing:.04em;color:#7A4A3A}
  .cause b{font-family:var(--f);font-weight:600;font-size:27px;color:#B3262E;letter-spacing:0}
  .logos{bottom:44px;height:130px;color:#6B4A2E}
  </style></head><body><div class="p">
  <svg width="0" height="0" style="position:absolute"><filter id="wc" x="-5%" y="-5%" width="110%" height="110%">
    <feTurbulence type="fractalNoise" baseFrequency=".035" numOctaves="3" seed="4" result="n"/>
    <feDisplacementMap in="SourceGraphic" in2="n" scale="7" result="d"/>
    <feTurbulence type="fractalNoise" baseFrequency=".9" numOctaves="2" seed="9" result="g"/>
    <feColorMatrix in="g" type="matrix" values="0 0 0 0 1  0 0 0 0 1  0 0 0 0 1  0 0 0 -1.4 .55" result="ga"/>
    <feComposite in="ga" in2="d" operator="in" result="gi"/>
    <feBlend in="d" in2="gi" mode="screen"/>
  </filter></svg>
  <div class="frame"></div>
  ${bunting}
  ${ornament(92, 250, 46, '#B3262E', '#F7EFE0')}${ornament(170, 150, 38, '#A8925C', '#F7EFE0')}
  ${ornament(990, 230, 44, '#3E7A5A', '#F7EFE0')}${ornament(912, 140, 34, '#B3262E', '#F7EFE0')}
  ${sprig(40, 640, 210, -10)}${sprig(830, 800, 210, 100, true)}
  ${gift(70, 900, 120, 84, '#DDE6D5', '#3E7A5A')}
  ${flake(250, 590, 44, '#C9A46A', .7)}${flake(820, 520, 34, '#C9A46A', .6, 20)}
  <div class="c kicker" style="top:236px;font-size:17px;color:#8A6B48">USYC представя</div>
  <div class="c" style="top:272px;font-family:var(--f);font-weight:500;font-size:52px;color:#3E7A5A;letter-spacing:.14em">БЛАГОТВОРИТЕЛЕН</div>
  <div class="c title" style="top:338px">${T1}<br><span class="t2">${T2}</span></div>
  <div class="wash"></div>
  ${bear({ id: 'b', fur: '#B98556', furDark: '#9E6C40', furLight: '#E3C097', scarf: '#B3262E', scarfDark: '#8E1C24', shadow: 'rgba(90,50,20,.18)', cap: '#2A2F3A' })}
  ${stamp({ ring: '#B3262E', text: '#B3262E', bg: 'none', id: 'sb', size: 190 }).replace("'#fff'", "'#F6EFE1'")}
  <div class="c date"><i></i><span>13.12.2026 · ХОТЕЛ РОСЛИН</span><i></i></div>
  <div class="c cause">В подкрепа на <b>Операция Плюшено мече</b> · Фондация Скритите таланти на България</div>
  ${logos('#6B4A2E', '#B3262E')}
  ${GRAIN(.55, .22)}
  </div></body></html>`;
}

/* ================= C — „Златна нощ“ (изумрудено) ================= */
function posterC() {
  return `<!doctype html><html lang="bg"><head><meta charset="utf-8">${FONTS}<style>${BASE}
  .p{background:radial-gradient(ellipse 80% 55% at 50% 58%,#1F5A47 0%,#123A2E 45%,#0B241D 100%);color:#F7EBD3}
  .arch{position:absolute;left:250px;top:470px;width:580px;height:612px;border-radius:290px 290px 0 0}
  .ar1{border:2px solid #D9B45F;border-bottom:none}
  .ar2{left:268px;top:488px;width:544px;height:594px;border-radius:272px 272px 0 0;border:1px solid rgba(217,180,95,.55);border-bottom:none;
    background:linear-gradient(180deg,rgba(217,180,95,.20),rgba(217,180,95,.03) 70%,rgba(217,180,95,0))}
  .glow{position:absolute;left:290px;top:560px;width:500px;height:500px;border-radius:50%;background:radial-gradient(closest-side,rgba(255,214,140,.42),rgba(255,214,140,0))}
  .title{font-size:122px;font-weight:600;letter-spacing:.05em;
    background:linear-gradient(180deg,#FFF6E2 20%,#E9CD8B 100%);-webkit-background-clip:text;color:transparent}
  .script{font-family:var(--f);font-weight:500;font-size:58px;color:#D9B45F;letter-spacing:.02em}
  .bear{position:absolute;left:350px;top:612px;width:380px}
  .floor{position:absolute;left:250px;top:1030px;width:580px;height:52px;background:radial-gradient(ellipse at 50% 0,rgba(0,0,0,.45),rgba(0,0,0,0) 70%)}
  .stamp{position:absolute;left:770px;top:500px;transform:rotate(13deg)}
  .date{top:1092px;font-family:var(--f);font-size:38px;font-weight:500;letter-spacing:.1em;color:#F7EBD3}
  .rule{position:absolute;top:1117px;height:1.5px;width:150px;background:linear-gradient(90deg,transparent,#D9B45F)}
  .cause{top:1151px;font-size:16.5px;font-weight:500;letter-spacing:.07em;color:#CDBE9E}
  .cause b{color:#E9CD8B;font-weight:600}
  .plaque{position:absolute;left:70px;right:70px;bottom:36px;height:120px;border-radius:14px;background:#F7EBD3;box-shadow:0 14px 30px rgba(0,0,0,.4)}
  .logos{bottom:36px;height:120px;color:#123A2E}
  .logos img{transform:scale(.86)}
  .fnd .f2{font-size:23px}
  </style></head><body><div class="p">
  ${dots(120, 21, '#F3DCA4', 1080, 1150, 0, 2.6)}
  <svg class="abs" style="left:0;top:0;filter:blur(6px);opacity:.5" width="1080" height="1350" fill="#E9C46A">
    <circle cx="120" cy="540" r="16"/><circle cx="960" cy="700" r="20"/><circle cx="200" cy="900" r="12"/><circle cx="900" cy="420" r="11"/><circle cx="70" cy="240" r="13"/><circle cx="1010" cy="200" r="15"/><circle cx="150" cy="1060" r="14"/><circle cx="940" cy="1000" r="11"/>
  </svg>
  <div class="abs" style="left:28px;top:28px;right:28px;bottom:28px;border:1px solid rgba(217,180,95,.45)"></div>
  ${star(516, 58, 48, '#D9B45F')}
  <div class="c kicker" style="top:128px;font-size:16px;color:#CDBE9E">USYC представя</div>
  <div class="c" style="top:176px"><span class="kicker" style="color:#D9B45F;letter-spacing:.6em;font-size:24px;padding-left:.6em">Благотворителен</span></div>
  <div class="c title" style="top:232px">${T1}<br>${T2}</div>
  <div class="arch ar1"></div><div class="arch ar2"></div>
  <div class="glow"></div>
  ${flake(160, 620, 64, '#D9B45F', .8)}${flake(880, 800, 52, '#D9B45F', .7, 18)}${flake(196, 880, 34, '#F7EBD3', .6, 10)}${flake(868, 340, 30, '#F7EBD3', .5)}
  ${star(214, 500, 26, '#F7EBD3', .9)}${star(840, 660, 20, '#F7EBD3', .9)}${star(130, 780, 18, '#D9B45F')}${star(930, 940, 24, '#D9B45F')}
  <div class="floor"></div>
  ${bear({ id: 'c', scarf: '#F3E6CC', scarfDark: '#D8C49C', trim: '#FFF8EC', hat: '#B3222B', shadow: 'rgba(0,0,0,.5)', cap: '#141A22', capLight: '#2A3442' }).replace('stroke="#FFF8EC" stroke-width="3" opacity=".45"', 'stroke="#B3222B" stroke-width="3" opacity=".6"')}
  ${stamp({ ring: '#D9B45F', text: '#D9B45F', bg: '#123A2E', id: 'sc', size: 196 })}
  <div class="rule" style="left:70px"></div><div class="rule" style="right:70px;transform:scaleX(-1)"></div>
  <div class="c date">13.12.2026 · ХОТЕЛ РОСЛИН</div>
  <div class="c cause">В подкрепа на <b>Операция Плюшено мече</b> · Фондация Скритите таланти на България</div>
  <div class="plaque"></div>
  ${logos('#123A2E', '#8A6A22')}
  ${GRAIN(.9, .18)}
  </div></body></html>`;
}

(async () => {
  const variants = { 'A-hartien-teatar': posterA(), 'B-akvarelna-kartichka': posterB(), 'C-zlatna-nosht': posterC() };
  const browser = await chromium.launch();
  const ctx = await browser.newContext({ viewport: { width: 1080, height: 1350 }, deviceScaleFactor: 2 });
  for (const [name, html] of Object.entries(variants)) {
    const file = path.join(OUT, `poster-${name}${TAG}.html`);
    fs.writeFileSync(file, html);
    const page = await ctx.newPage();
    await page.goto('file://' + file, { waitUntil: 'networkidle' });
    await page.evaluate(() => document.fonts.ready);
    await page.screenshot({ path: path.join(OUT, `poster-${name}${TAG}.png`) });
    await page.close();
    console.log('ok', name);
  }
  await browser.close();
})();
