> 🌐 **Languages:** [English](README.md) | [Русский](README.ru.md) | [ไทย](README.th.md) | [简体中文](README.zh-CN.md)

<div align="center">
  <img src="materials/icon/rotating_third_person.png" alt="Logo" width="256" height="256">
  <h1>Third Person Rotating Camera</h1>
  <p><b>มุมกล้องแบบมองข้ามไหล่สำหรับ Garry's Mod ที่ปรับแต่งได้อย่างอิสระ ได้รับแรงบันดาลใจจาก Haydee</b></p>
  
  [![Steam Workshop](https://img.shields.io/badge/Steam-Workshop-171a21?style=for-the-badge&logo=steam&logoColor=white)](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091)
  <br/>
  [![Steam Views](https://img.shields.io/steam/views/1620191091?logo=steam&label=Unique%20Visitors)](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091)
  [![Steam Subscriptions](https://img.shields.io/steam/subscriptions/1620191091?logo=steam)](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091)
  [![Steam Favorites](https://img.shields.io/steam/favorites/1620191091?logo=steam)](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091)
  <br/>
  [![Tests](https://github.com/thegamerbay/gmod-rotating-third-person/actions/workflows/test.yml/badge.svg)](https://github.com/thegamerbay/gmod-rotating-third-person/actions/workflows/test.yml)
  [![Linting](https://github.com/thegamerbay/gmod-rotating-third-person/actions/workflows/lint.yml/badge.svg)](https://github.com/thegamerbay/gmod-rotating-third-person/actions/workflows/lint.yml)
  [![codecov](https://codecov.io/gh/thegamerbay/gmod-rotating-third-person/graph/badge.svg)](https://codecov.io/gh/thegamerbay/gmod-rotating-third-person)
  [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
</div>

<br/>

## 📖 ภาพรวม

**Third Person Rotating Camera** เป็นส่วนเสริม (Addon) สำหรับ Garry's Mod ที่จะมาปรับโฉมมุมมองบุคคลที่สามเริ่มต้นของเกมใหม่ทั้งหมด ออกแบบมาให้เหมือนกับระบบกล้องของเกม *Haydee* ทุกประการ ม็อดนี้มุ่งเน้นไปที่การมอบระบบมุมกล้องแบบมองข้ามไหล่ที่แม่นยำ ตอบสนองได้ดี และปรับแต่งได้อย่างอิสระ

ไม่ว่าคุณจะกำลังเล่นในโหมด Sandbox หรือสำรวจแผนที่ ส่วนเสริมนี้จะมอบการควบคุมมุมมองที่เหนือชั้น เพื่อยกระดับประสบการณ์การเล่นเกมของคุณให้ถึงขีดสุด

---

## ✨ ฟีเจอร์หลัก

* **ระบบเล็งเป้าหมายที่สมจริง:** โมเดลผู้เล่นของคุณจะปรับท่าทางและมองไปยังจุดที่คุณเล็งอย่างแม่นยำ
* **ระบบคาดการณ์ผู้เล่นหลายคน (Multiplayer Prediction) ที่แม่นยำ:** หมดปัญหาการเดินกระตุก (Rubberbanding) หรือ "การเดินเอง"! การเคลื่อนไหวจะถูกซิงค์และคำนวณตามมุมกล้องอย่างสมบูรณ์แบบ
* **การทำงานร่วมกับสโคปปืนแบบอัจฉริยะ (Smart Scope):** ใช้งานร่วมกับฐานอาวุธ (Weapon bases) อย่าง TFA หรือ CW 2.0 ได้อย่างไร้ปัญหา กล้องจะเปลี่ยนเป็นมุมมองบุคคลที่หนึ่งโดยอัตโนมัติเมื่อเล็งผ่านสโคปปืนสไนเปอร์กำลังขยายสูง
* **โหมดการเคลื่อนไหวแบบคลาสสิก (Classic Movement Mode):** ชอบการควบคุมแบบมาตรฐานของ Garry's Mod มากกว่า? คุณสามารถเปิดใช้งานโหมดคลาสสิกเพื่อล็อกโมเดลผู้เล่นให้หันตามทิศทางกล้อง โดยยังคงมุมมองแบบข้ามไหล่เอาไว้ได้
* **สลับการเล็ง (Toggle Aim):** ไม่อยากกดปุ่มเล็งค้างไว้? เปิดใช้งานการสลับการเล็งในหน้าการตั้งค่า เพื่อคลิกครั้งเดียวสำหรับการเข้าโหมดเล็ง
* **รองรับการกลับแกน Y (Invert Y-Axis):** มีระบบสลับแกนในตัวสำหรับผู้เล่นที่ชื่นชอบการควบคุมการก้มเงยแบบคันบังคับเครื่องบิน
* **ความไวของกล้อง:** ปรับแต่งความเร็วในการหันมุมกล้องมองข้ามไหล่ด้วยตัวคูณเฉพาะ เพื่อชดเชยเอฟเฟกต์พารัลแลกซ์ของมุมมองบุคคลที่สาม
* **การสลับไหล่ (Shoulder Switching):** สลับมุมกล้องจากไหล่ขวาเป็นไหล่ซ้ายอย่างรวดเร็วด้วยคำสั่งเดียว
* **เป้าเล็งตามวิถีกระสุนจริง (Dynamic Crosshair Tracing):** เปิดใช้งานเป้าเล็งตามวิถีกระสุนเพื่อดูตำแหน่งเป้าหมายแบบ 3 มิติที่คุณจะยิงโดนจริงๆ ปรับแต่งสี RGBA และขนาดได้อย่างอิสระ!
* **ระดับกล้องที่ลดลงขณะหมอบ (Crouch Camera Drop):** ควบคุมมุมมองขณะหมอบได้อย่างสมบูรณ์! ปรับแต่งระดับกล้องที่ลดลงเพื่อหลีกเลี่ยงการโดนบดบังทัศนวิสัยในพื้นที่แคบ
* **การปรับแต่งที่ครอบคลุม:** จัดการระยะห่างของกล้อง (แกน X, Y และ Z), FOV และความเร็วต่างๆ ได้อย่างสะดวกผ่านเมนู Context Menu ของ Garry's Mod
* **รองรับหลากหลายภาษา (31 ภาษา):** สัมผัสประสบการณ์การแปล UI ที่มีคุณภาพและคำอธิบายช่วยเหลือสำหรับทุกๆ การตั้งค่าในภาษาของคุณ

---

## 🎮 วิธีใช้งาน

### เมนูภายในเกม
ปรับแต่งกล้องแบบเรียลไทม์โดยไม่ต้องพิมพ์คำสั่งใดๆ!
1. กดปุ่ม **`C`** ค้างไว้เพื่อเปิดเมนู Context Menu ของ Garry's Mod
2. คลิกที่ไอคอน **Third Person Rotating Camera** (มักจะอยู่ที่แถบด้านบนหรือในแท็บเฉพาะ)
3. ปรับแถบเลื่อน (Slider) สำหรับระยะห่างกล้อง, การเลื่อนขึ้น/ลง, ซ้าย/ขวา และ FOV
4. ตั้งค่าปุ่มเล็ง (Aiming) ตามที่คุณถนัด (ค่าเริ่มต้นคือ คลิกขวา)
5. เปิดหรือปิดใช้งานฟีเจอร์ต่างๆ เช่น Toggle Aim, Smart Scope และ Invert Y-Axis ได้โดยตรงผ่านช่องทำเครื่องหมาย (Checkbox)

![Settings Menu](assets/settings.jpg)

### การตั้งปุ่มลัด (Keybinds)
คุณสามารถตั้งปุ่มสำหรับฟังก์ชันที่มีประโยชน์ผ่านคอนโซลนักพัฒนา (`~`) ได้โดยตรง:

```bash
# เปิดและปิดมุมกล้องบุคคลที่สามด้วยปุ่มเดียว (เช่น ปุ่ม 'X')
bind x "rtp_toggle"

# สลับไหล่อย่างรวดเร็ว (ย้ายกล้องจากขวาไปซ้าย หรือซ้ายไปขวา)
bind v "rtp_switch_shoulder"
```

---

## ⚙️ การตั้งค่า ConVar

สำหรับเจ้าของเซิร์ฟเวอร์หรือผู้ใช้งานระดับสูง สามารถปรับตั้งค่าตัวแปรทั้งหมดผ่านคอนโซลได้

| ConVar | คำอธิบาย | ค่าเริ่มต้น |
| :--- | :--- | :---: |
| `rtp_enabled` | เปิด (1) หรือปิด (0) การทำงานของส่วนเสริม | `1` |
| `rtp_camera_forward` | ควบคุมระยะห่างของกล้องจากตัวผู้เล่น | `50` |
| `rtp_camera_right` | ควบคุมระยะเยื้องแนวนอนของกล้องจากตัวผู้เล่น | `20` |
| `rtp_camera_up` | ควบคุมระยะเยื้องแนวตั้งของกล้องจากตัวผู้เล่น | `-10` |
| `rtp_camera_crouch_drop` | กล้องจะลดระดับลงเท่าใดเมื่อผู้เล่นหมอบ (0 = ไม่ลดลง) | `20` |
| `rtp_camera_fov` | กำหนดค่า Field of View (FOV) ของกล้อง | `75` |
| `rtp_camera_zoom_fov` | จำนวน FOV ที่จะลดลงเมื่อทำการเล็ง | `15` |
| `rtp_camera_sens_multiplier` | ตัวคูณความเร็วในการหมุนกล้อง (1.0 = ปกติ, 0.5 = ครึ่งความเร็ว) | `1.0` |
| `rtp_player_rotation_speed`| ควบคุมความเร็วการหันโมเดลผู้เล่นให้ตรงกับการเคลื่อนไหว | `5` |
| `rtp_player_aiming_button` | รหัสปุ่มเมาส์/คีย์บอร์ดสำหรับปุ่มเล็ง | `108` |
| `rtp_toggle_aim` | หากเป็น 1, การคลิกปุ่มเล็งจะเป็นการเปิด/ปิดโหมดเล็ง | `0` |
| `rtp_smart_scope` | ปิดมุมมองบุคคลที่สามอัตโนมัติเมื่อซูม (FOV < ค่าที่กำหนด) | `1` |
| `rtp_smart_scope_threshold` | กำหนดค่าขีดจำกัด FOV หากต่ำกว่าค่านี้ Smart Scope จะสลับเป็นบุคคลที่หนึ่งอัตโนมัติ | `50` |
| `rtp_invert_y` | สลับแกนการก้มเงยเมาส์แนวตั้ง | `0` |
| `rtp_crosshair_hidden_if_not_aiming` | ซ่อนเป้าเล็งเริ่มต้นขณะที่ไม่ได้เล็ง | `0` |
| `rtp_classic_movement_mode` | เปิดโหมดเคลื่อนไหวแบบคลาสสิก: ล็อกการหมุนโมเดลให้หันตามทิศทางกล้อง | `0` |
| `rtp_crosshair_trace_position` | แสดงเป้าเล็งแบบไดนามิกที่จะบอกวิถีกระสุนที่แท้จริง | `0` |
| `rtp_crosshair_size` | ปรับขนาดของเป้าเล็งแบบกำหนดเอง | `3` |
| `rtp_crosshair_r`, `g`, `b`, `a` | ปรับสี (RGBA) ของเป้าเล็งแบบกำหนดเอง | `255, 230, 0, 240` |

---

## 🧪 การทดสอบสำหรับนักพัฒนา (Busted)

เพื่อให้มั่นใจในเสถียรภาพของสคริปต์คุณภาพสูงโดยไม่ต้องเข้าเกม โปรเจกต์นี้ได้รับการติดตั้งเฟรมเวิร์กการทดสอบ Lua ที่ชื่อว่า **Busted** อย่างเต็มรูปแบบ โดย Garry's Mod API จะถูกจำลอง (Mocked) อย่างปลอดภัยไว้ใน `spec/helpers/gmod_mocks.lua`

**สิ่งที่ต้องเตรียมพร้อม:**
คุณจะต้องติดตั้ง [Lua](https://www.lua.org/) และ [LuaRocks](https://luarocks.org/) ไว้ในเครื่องของคุณ
```bash
# ติดตั้ง busted ผ่าน luarocks
luarocks install busted
```

**การรันการทดสอบ:**
เข้าไปยังโฟลเดอร์ root ของส่วนเสริมและรันคำสั่ง:
```bash
busted
```

---

## 🛠️ เครดิตและคำติชม

* **แรงบันดาลใจ:** ระบบกล้องจากเกม *Haydee*
* **คำติชม:** หากคุณพบปัญหา บั๊ก หรือต้องการเสนอแนะฟีเจอร์ใดๆ โปรดคอมเมนต์ไว้ที่ [หน้า Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091)

---

## 📄 สัญญาอนุญาต (License)

โปรเจกต์นี้อยู่ภายใต้ [MIT License](LICENSE) - ดูรายละเอียดเพิ่มเติมได้ในไฟล์ LICENSE