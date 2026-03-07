> 🌐 **ภาษา:** [English](README.md) | [Русский](README.ru.md) | [ไทย](README.th.md) | [简体中文](README.zh-CN.md)

<div align="center">
  <img src="materials/icon/rotating_third_person.png" alt="Logo" width="256" height="256">
  <h1>กล้องมุมมองบุคคลที่สามแบบหมุนได้</h1>
  <p><b>กล้องมองข้ามไหล่ที่ปรับแต่งได้สูงสำหรับ Garry's Mod ซึ่งได้รับแรงบันดาลใจจาก Haydee</b></p>
  
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

**กล้องมุมมองบุคคลที่สามแบบหมุนได้ (Third Person Rotating Camera)** เป็นส่วนเสริม (Addon) สำหรับ Garry's Mod ที่จะปรับเปลี่ยนมุมมองบุคคลที่สามเริ่มต้นของเกมใหม่ทั้งหมด โดยออกแบบมาให้เหมือนกับระบบกล้องของเกม *Haydee* ม็อดนี้มีจุดมุ่งหมายเพื่อส่งมอบระบบกล้องมองข้ามไหล่ที่แม่นยำ ตอบสนองได้ดี และปรับแต่งได้อย่างอิสระ

ไม่ว่าคุณจะเล่นในโหมด Sandbox หรือกำลังสำรวจแผนที่ ส่วนเสริมนี้จะมอบการควบคุมมุมมองที่เหนือชั้น เพื่อยกระดับประสบการณ์การเล่นเกมของคุณให้ถึงขีดสุด

---

## ✨ คุณสมบัติ

* **ระบบหันตามเป้าหมายที่แท้จริง (True Aim-to-Look):** โมเดลตัวละครของคุณจะปรับและหันไปมองในทิศทางที่คุณกำลังเล็งอยู่อย่างแม่นยำ
* **การคาดเดาผู้เล่นหลายคนที่แม่นยำ:** หมดปัญหาการกระตุก (Rubberbanding) หรือ "การเดินเอง"! การเคลื่อนไหวจะถูกซิงค์และคำนวณตามมุมกล้องอย่างสมบูรณ์แบบ
* **ทำงานร่วมกับสโคปอย่างชาญฉลาด:** สามารถเล่นร่วมกับระบบอาวุธอย่าง TFA หรือ CW 2.0 ได้โดยไม่เกิดความขัดแย้ง กล้องจะสลับเข้าสู่มุมมองบุคคลที่หนึ่งอัตโนมัติเมื่อเล็งผ่านสโคปปืนสไนเปอร์กำลังขยายสูง
* **โหมดการเดินแบบคลาสสิก:** ชอบการควบคุมแบบดั้งเดิมของ Garry's Mod มากกว่า? คุณสามารถเปิดใช้งานโหมดคลาสสิกเพื่อล็อคให้โมเดลตัวละครหันตามทิศทางกล้อง โดยยังคงรักษามุมมองแบบข้ามไหล่ไว้ได้
* **เล็งแบบสลับ (Toggle Aim):** ไม่ชอบกดปุ่มเล็งค้างไว้? เปิดใช้งานการเล็งแบบสลับในการตั้งค่าเพื่อใช้การคลิกเพียงครั้งเดียวในการเล็ง
* **รองรับการกลับแกน Y (Invert Y-Axis):** มีระบบสลับแกนในตัวสำหรับผู้เล่นที่ชื่นชอบการควบคุมการก้มเงยแบบจอยสติ๊กเครื่องบินแบบดั้งเดิม
* **การสลับไหล่:** สลับกล้องจากไหล่ขวาไปซ้ายได้อย่างรวดเร็วด้วยคำสั่งเดียว
* **เป้าเล็งแบบไดนามิก:** เปิดใช้งานเป้าเล็งตามวิถีกระสุนจริง เพื่อดูจุดตกของกระสุนในพื้นที่ 3 มิติได้อย่างแม่นยำ
* **ปรับแต่งได้อย่างครอบคลุม:** จัดการระยะห่างของกล้อง (แกน X, Y และ Z), FOV และความเร็วต่างๆ ได้อย่างราบรื่นผ่าน Context Menu ของ Garry's Mod
* **รองรับหลากหลายภาษา (31 ภาษา):** เพลิดเพลินกับการแปลหน้าต่าง UI ที่มีคุณภาพสูงและคำอธิบายช่วยเหลือ (Tooltips) สำหรับทุกๆ การตั้งค่า

---

## 🎮 วิธีใช้งาน

### เมนูในเกม
ปรับแต่งกล้องแบบเรียลไทม์โดยไม่ต้องพิมพ์คำสั่งใดๆ!
1. กดปุ่ม **`C`** ค้างไว้เพื่อเปิด Context Menu ของ Garry's Mod
2. คลิกที่ไอคอน **Third Person Rotating Camera** (มักจะอยู่บนแถบด้านบนหรือในแท็บที่จัดไว้ให้โดยเฉพาะ)
3. ปรับแถบเลื่อนสำหรับระยะกล้อง, ขึ้น/ลง, ขวา/ซ้าย และระยะการมองเห็น (FOV)
4. ตั้งค่าปุ่มเล็งตามที่คุณต้องการ (ค่าเริ่มต้นคือปุ่มเมาส์ขวา)
5. เปิดหรือปิดคุณสมบัติใหม่ๆ เช่น เล็งแบบสลับ (Toggle Aim), การใช้สโคปอัจฉริยะ (Smart Scope) และกลับแกน Y ได้โดยตรงผ่านช่องทำเครื่องหมาย (Checkboxes)

![Settings Menu](assets/settings.jpg)

### การตั้งปุ่มลัดอย่างรวดเร็ว (Quick Keybinds)
คุณสามารถตั้งค่าปุ่มสำหรับฟังก์ชั่นที่มีประโยชน์ได้โดยตรงในคอนโซลผู้พัฒนา (`~`):

```bash
# Toggle the third-person camera ON and OFF with a single key (e.g., 'X')
bind x "rtp_toggle"

# Quickly swap shoulders (moves camera from right to left, or vice versa)
bind v "rtp_switch_shoulder"
```

---

## ⚙️ การตั้งค่า ConVar

สำหรับเจ้าของเซิร์ฟเวอร์หรือผู้ใช้งานระดับสูง ตัวแปรทั้งหมดสามารถตั้งค่าได้ผ่านคอนโซล

| ConVar | คำอธิบาย | ค่าเริ่มต้น |
| :--- | :--- | :---: |
| `rtp_enabled` | เปิด (1) หรือปิด (0) การทำงานของส่วนเสริม | `1` |
| `rtp_camera_forward` | ควบคุมระยะห่างของกล้องจากตัวผู้เล่น | `50` |
| `rtp_camera_right` | ควบคุมระยะเยื้องในแนวนอนของกล้องจากตัวผู้เล่น | `20` |
| `rtp_camera_up` | ควบคุมระยะเยื้องในแนวตั้งของกล้องจากตัวผู้เล่น | `-10` |
| `rtp_camera_fov` | ตั้งค่าระยะการมองเห็น (FOV) เป้าหมายสำหรับกล้อง | `75` |
| `rtp_camera_zoom_fov` | กำหนดค่า FOV ที่จะลดลงเมื่อทำการเล็ง | `15` |
| `rtp_player_rotation_speed`| ควบคุมความเร็วในการหันโมเดลผู้เล่นให้ตรงกับการเคลื่อนไหว | `5` |
| `rtp_player_aiming_button` | รหัสปุ่มเมาส์/คีย์บอร์ดสำหรับปุ่มเล็ง | `108` |
| `rtp_toggle_aim` | หากเป็น 1, การคลิกปุ่มเล็งจะเป็นการสลับสถานะการเล็ง (เปิด/ปิด) | `0` |
| `rtp_smart_scope` | ปิดมุมมองบุคคลที่สามอัตโนมัติเมื่อซูมเข้า (FOV < 50) | `1` |
| `rtp_invert_y` | กลับแกนการหมุนเมาส์ในแนวตั้ง | `0` |
| `rtp_crosshair_hidden_if_not_aiming` | ซ่อนเป้าเล็งเริ่มต้นในขณะที่ไม่ได้เล็ง | `0` |
| `rtp_classic_movement_mode` | เปิดใช้งานโหมดการเดินแบบคลาสสิก: ล็อคการหมุนโมเดลให้ตรงกับทิศทางของกล้อง | `0` |
| `rtp_crosshair_trace_position` | วาดเป้าเล็งแบบไดนามิกแบบกำหนดเองเพื่อแสดงวิถีกระสุนที่แท้จริง | `0` |

---

## 🧪 การทดสอบสำหรับนักพัฒนา (Busted)

เพื่อให้มั่นใจในเสถียรภาพของสคริปต์ที่มีคุณภาพสูงโดยไม่ต้องเปิดเกม โปรเจกต์นี้ได้รับการติดตั้งกรอบการทดสอบ Lua **Busted** ไว้อย่างสมบูรณ์ API ของ Garry's Mod จะถูกจำลองการทำงานอย่างปลอดภัยใน `spec/helpers/gmod_mocks.lua`

**สิ่งที่ต้องมีล่วงหน้า:**
คุณจะต้องติดตั้ง [Lua](https://www.lua.org/) และ [LuaRocks](https://luarocks.org/) บนเครื่องของคุณ
```bash
# Install busted via luarocks
luarocks install busted
```

**การรันการทดสอบ:**
นำทางไปยังไดเรกทอรีหลักของส่วนเสริมและรัน:
```bash
busted
```

---

## 🛠️ เครดิตและข้อเสนอแนะ

* **แรงบันดาลใจ:** ระบบกล้องจากเกม *Haydee*
* **ข้อเสนอแนะ:** หากคุณพบปัญหา บัค หรือต้องการเสนอแนะฟีเจอร์เพิ่มเติม โปรดแสดงความคิดเห็นได้ที่ [Steam Workshop Page](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091)

---

## 📄 สัญญาอนุญาต (License)

โปรเจกต์นี้ได้รับอนุญาตภายใต้ [MIT License](LICENSE) - ดูรายละเอียดได้ในไฟล์ LICENSE