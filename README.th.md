> 🌐 **Languages:** [English](README.md) | [Русский](README.ru.md) | [ไทย](README.th.md) | [简体中文](README.zh-CN.md)

<div align="center">
  <img src="materials/icon/rotating_third_person.png" alt="Logo" width="256" height="256">
  <h1>Third Person Rotating Camera</h1>
  <p><b>กล้องมุมมองข้ามหัวไหล่ (Over-the-shoulder) สำหรับ Garry's Mod ที่ปรับแต่งได้อย่างยืดหยุ่น โดยได้รับแรงบันดาลใจจากเกม Haydee</b></p>
  
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

**Third Person Rotating Camera** เป็นส่วนเสริม (Addon) ของ Garry's Mod ที่จะมาพลิกโฉมมุมกล้องบุคคลที่สามแบบเดิมๆ ของเกมอย่างสิ้นเชิง โดยออกแบบมาให้มีกลไกมุมกล้องเหมือนกับเกม *Haydee* ม็อดนี้มีเป้าหมายเพื่อมอบระบบกล้องมุมมองข้ามหัวไหล่ที่แม่นยำ ตอบสนองไว และปรับแต่งได้อย่างอิสระ

ไม่ว่าคุณจะเล่นในโหมด Sandbox หรือกำลังสำรวจแผนที่ ส่วนเสริมนี้จะมอบการควบคุมมุมมองที่เหนือชั้น เพื่อยกระดับประสบการณ์การเล่นเกมของคุณให้ถึงขีดสุด

---

## ✨ คุณสมบัติหลัก

* **ระบบเล็งทิศทางสมจริง (True Aim-to-Look):** โมเดลตัวละครของคุณจะปรับและหันไปในทิศทางเดียวกับที่คุณเล็งอยู่อย่างแม่นยำและลื่นไหล
* **การคาดเดาตำแหน่งในโหมดผู้เล่นหลายคนแม่นยำ:** หมดปัญหาอาการกระตุก (Rubberbanding) หรือ "เดินเอง"! การเคลื่อนไหวจะซิงค์กันอย่างสมบูรณ์และคำนวณตามมุมกล้อง
* **ระบบ Scope อัจฉริยะ:** เล่นร่วมกับปืนพื้นฐานอย่าง TFA หรือ CW 2.0 ได้โดยไม่มีปัญหา มุมกล้องจะสลับกลับไปยังมุมมองบุคคลที่หนึ่งอัตโนมัติอย่างแนบเนียน เมื่อเล็งผ่านกล้องสไนเปอร์กำลังขยายสูง
* **โหมดการเดินแบบคลาสสิก:** หากคุณชอบการควบคุมแบบดั้งเดิมของ Garry's Mod คุณสามารถเปิดการตั้งค่าโหมด Classic เพื่อล็อกทิศทางโมเดลผู้เล่นให้หันตามมุมกล้อง ในขณะที่ยังคงมุมมองแบบข้ามหัวไหล่ไว้ได้
* **สลับการเล็ง (Toggle Aim):** ไม่ชอบกดปุ่มเล็งค้างไว้ใช่ไหม? เปิดใช้งาน Toggle Aim ในการตั้งค่าเพื่อคลิกครั้งเดียวสำหรับการเล็งได้เลย
* **รองรับการกลับแกน Y (Invert Y-Axis):** ระบบกลับแกนในตัวสำหรับผู้เล่นที่ชื่นชอบการควบคุมการก้มเงยแบบคันบังคับเครื่องบิน
* **ความไวของมุมกล้อง:** ปรับความเร็วในการหันมุมกล้องข้ามหัวไหล่ด้วยการตั้งค่าตัวคูณเฉพาะ เพื่อชดเชยกับเอฟเฟกต์พารัลแลกซ์ของมุมมองบุคคลที่สาม
* **สลับไหล่:** สลับมุมกล้องของคุณจากไหล่ขวาไปไหล่ซ้ายได้อย่างรวดเร็วด้วยคำสั่งเดียว
* **เป้าเล็งตามวิถีกระสุนจริง:** เปิดใช้งานเป้าเล็งแบบวิถีกระสุนจริง เพื่อดูจุดที่กระสุนของคุณจะกระทบเป้าหมายในพื้นที่ 3 มิติได้อย่างแม่นยำ
* **ปรับแต่งได้อย่างครอบคลุม:** จัดการระยะห่างของมุมกล้องทั้งแกน X, Y และ Z รวมถึงระยะการมองเห็น (FOV) และความเร็วต่างๆ ผ่าน Context Menu ของ Garry's Mod ได้อย่างลื่นไหล
* **รองรับภาษาอย่างเต็มรูปแบบ (31 ภาษา):** เพลิดเพลินกับการแปลภาษาบน UI ที่มีคุณภาพสูงและคำอธิบายช่วยเหลือตามบริบทสำหรับการตั้งค่าทุกจุด

---

## 🎮 วิธีใช้งาน

### เมนูในเกม
ปรับแต่งมุมกล้องแบบเรียลไทม์ได้ทันทีโดยไม่ต้องพิมพ์คำสั่งใดๆ!
1. กดปุ่ม **`C`** ค้างไว้เพื่อเปิด Context Menu ของ Garry's Mod
2. คลิกที่ไอคอน **Third Person Rotating Camera** (มักจะอยู่บนแถบด้านบนหรือภายใต้แท็บเฉพาะ)
3. ปรับสไลเดอร์สำหรับระยะกล้อง, ขึ้น/ลง, ขวา/ซ้าย และ FOV
4. ตั้งค่าปุ่มเล็ง (Aiming) ตามที่คุณถนัด (ค่าเริ่มต้นคือคลิกขวา)
5. เปิดหรือปิดใช้งานคุณสมบัติใหม่ๆ เช่น Toggle Aim, Smart Scope และการกลับแกน Y ผ่านช่องกาเครื่องหมาย (Checkbox) ได้โดยตรง

![Settings Menu](assets/settings.jpg)

### การตั้งค่าปุ่มลัดด่วน (Keybinds)
คุณสามารถตั้งค่าปุ่มสำหรับใช้งานฟังก์ชันที่มีประโยชน์ผ่านคอนโซลนักพัฒนาซอฟต์แวร์ (`~`) ได้โดยตรง:

```bash
# เปิดและปิดมุมกล้องบุคคลที่สามด้วยปุ่มเดียว (เช่น ปุ่ม 'X')
bind x "rtp_toggle"

# สลับไหล่อย่างรวดเร็ว (ย้ายมุมกล้องจากขวาไปซ้าย หรือจากซ้ายไปขวา)
bind v "rtp_switch_shoulder"
```

---

## ⚙️ การตั้งค่า ConVar

สำหรับเจ้าของเซิร์ฟเวอร์หรือผู้ใช้งานระดับสูง ตัวแปรทั้งหมดสามารถปรับแต่งได้ผ่านทางคอนโซล

| ConVar | คำอธิบาย | ค่าเริ่มต้น |
| :--- | :--- | :---: |
| `rtp_enabled` | เปิด (1) หรือ ปิด (0) ส่วนเสริม | `1` |
| `rtp_camera_forward` | ควบคุมระยะห่างของมุมกล้องจากตัวผู้เล่น | `50` |
| `rtp_camera_right` | ควบคุมระยะเยื้องแนวนอนของมุมกล้องจากตัวผู้เล่น | `20` |
| `rtp_camera_up` | ควบคุมระยะเยื้องแนวตั้งของมุมกล้องจากตัวผู้เล่น | `-10` |
| `rtp_camera_fov` | กำหนดค่าขอบเขตการมองเห็น (FOV) เป้าหมายของกล้อง | `75` |
| `rtp_camera_zoom_fov` | จำนวน FOV ที่จะถูกลดลงเมื่อทำการเล็ง | `15` |
| `rtp_camera_sens_multiplier` | ตัวคูณความเร็วในการหมุนกล้อง (1.0 = ปกติ, 0.5 = ครึ่งหนึ่งของความเร็วปกติ) | `1.0` |
| `rtp_player_rotation_speed`| ควบคุมความเร็วการหันโมเดลผู้เล่นให้ตรงกับการเคลื่อนไหว | `5` |
| `rtp_player_aiming_button` | รหัสปุ่ม (Keycode) เมาส์/คีย์บอร์ด สำหรับปุ่มเล็ง | `108` |
| `rtp_toggle_aim` | หากเป็น 1 การคลิกปุ่มเล็งจะเป็นการสลับสถานะการเล็ง (กดเปิด-ปิด) | `0` |
| `rtp_smart_scope` | ปิดใช้งานมุมมองบุคคลที่สามโดยอัตโนมัติเมื่อซูมเข้า (FOV < 50) | `1` |
| `rtp_invert_y` | กลับทิศทางการหมุนมุมก้มเงยของเมาส์ในแนวตั้ง | `0` |
| `rtp_crosshair_hidden_if_not_aiming` | ซ่อนเป้าเล็งเริ่มต้นขณะที่ไม่ได้เล็ง | `0` |
| `rtp_classic_movement_mode` | เปิดใช้งานโหมดการเดินแบบคลาสสิก: ล็อกทิศทางการหมุนของโมเดลตามทิศทางมุมกล้อง | `0` |
| `rtp_crosshair_trace_position` | แสดงเป้าเล็งแบบไดนามิกที่แสดงวิถีกระสุนจริง | `0` |

---

## 🧪 การทดสอบสำหรับนักพัฒนา (Busted)

เพื่อให้มั่นใจในเสถียรภาพของสคริปต์ว่ามีคุณภาพสูงโดยไม่จำเป็นต้องเปิดเกม โปรเจกต์นี้ได้รับการติดตั้งเครื่องมือทดสอบ **Busted** ซึ่งเป็นเฟรมเวิร์กการทดสอบของ Lua อย่างเต็มรูปแบบ โดย API ของ Garry's Mod จะถูกทำจำลองอย่างปลอดภัยไว้ใน `spec/helpers/gmod_mocks.lua`

**ข้อกำหนดเบื้องต้น:**
คุณต้องติดตั้ง [Lua](https://www.lua.org/) และ [LuaRocks](https://luarocks.org/) ในเครื่องของคุณ
```bash
# ติดตั้ง busted ผ่าน luarocks
luarocks install busted
```

**การรันการทดสอบ:**
เข้าไปยังโฟลเดอร์หลัก (Root directory) ของส่วนเสริมแล้วรันคำสั่ง:
```bash
busted
```

---

## 🛠️ เครดิตและข้อเสนอแนะ

* **แรงบันดาลใจ:** กลไกมุมกล้องจากเกม *Haydee*
* **ข้อเสนอแนะ:** หากคุณพบปัญหา บั๊ก หรือต้องการเสนอแนะฟีเจอร์เพิ่มเติม โปรดแสดงความคิดเห็นได้ที่ [หน้า Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091)

---

## 📄 สัญญาอนุญาต (License)

โปรเจกต์นี้อยู่ภายใต้ [MIT License](LICENSE) - ดูรายละเอียดเพิ่มเติมได้ในไฟล์ LICENSE