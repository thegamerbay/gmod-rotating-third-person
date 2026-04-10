> 🌐 **Languages:** [English](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/README.md) | [Русский](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.ru.md) | [ไทย](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.th.md) | [简体中文](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.zh.md) | [Español](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.es.md) | [العربية](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.ar.md)

<div align="center">
  <img src="materials/icon/rotating_third_person.png" alt="Logo" width="256" height="256">
  <h1>Third Person Rotating Camera</h1>
  <p><b>ม็อดกล้องข้ามไหล่ที่สามารถปรับแต่งได้สูงสำหรับ Garry's Mod ซึ่งได้รับแรงบันดาลใจจากเกม Haydee</b></p>
  
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

**Third Person Rotating Camera** เป็นแอดออนของ Garry's Mod ที่จะปรับปรุงมุมมองบุคคลที่สามที่เป็นค่าเริ่มต้นของเกมใหม่ทั้งหมด ด้วยการออกแบบที่เหมือนกับระบบกล้องจากเกม *Haydee* ม็อดนี้มีเป้าหมายที่จะมอบระบบกล้องข้ามไหล่ที่แม่นยำ ตอบสนองได้ดี และปรับแต่งได้สูง

ไม่ว่าคุณจะกำลังเล่นโหมดแซนด์บ็อกซ์หรือสำรวจแผนที่ แอดออนนี้ก็มอบการควบคุมมุมมองของคุณที่เหนือชั้นเพื่อเพิ่มประสบการณ์การเล่นเกมของคุณให้ถึงขีดสุด

---

## ✨ ฟีเจอร์หลัก

* **ระบบเล็งเป้าหมายที่แท้จริง (True Aim-to-Look):** โมเดลผู้เล่นของคุณจะปรับเปลี่ยนแบบไดนามิกและมองไปในทิศทางที่คุณกำลังเล็งอยู่อย่างแม่นยำ
* **ความลื่นไหลในการหมุนตัวตอนเล็ง:** ปรับแต่งความลื่นไหลในการหมุนตัวของตัวละครให้ตรงกับมุมกล้องขณะใช้งานระบบการเล็งอาวุธได้อย่างอิสระ
* **การคาดการณ์ในโหมดผู้เล่นหลายคนที่แม่นยำ:** หมดปัญหาการกระตุก (Rubberbanding) หรือ "การเดินเอง"! การเคลื่อนไหวจะซิงค์กันอย่างสมบูรณ์และคำนวณตามมุมกล้อง
* **โหมดไฮบริด (Smart Scope):** เล่นร่วมกับฐานอาวุธอื่น ๆ เช่น TFA หรือ CW 2.0 ได้โดยไม่มีข้อขัดแย้ง มุมกล้องจะสลับไปเป็นมุมมองบุคคลที่หนึ่งอัตโนมัติอย่างราบรื่นเมื่อคุณทำการเล็ง
* **โหมดการเคลื่อนไหวแบบคลาสสิก:** ชอบการควบคุมแบบมาตรฐานของ Garry's Mod มากกว่า? เปิดใช้งานโหมดคลาสสิกเพื่อล็อกโมเดลผู้เล่นของคุณไปในทิศทางเดียวกับกล้อง โดยยังคงมุมมองแบบข้ามไหล่ไว้
* **เปิด/ปิดการเล็ง (Toggle Aim):** ไม่ชอบกดปุ่มเล็งค้างไว้? สามารถเปิดใช้งานโหมด Toggle Aim ในการตั้งค่าเพื่อเล็งด้วยการคลิกเพียงครั้งเดียว
* **รองรับการกลับแกน Y (Invert Y-Axis):** ระบบกลับแกนในตัวสำหรับผู้เล่นที่ชื่นชอบการควบคุมแบบคันบังคับการบินแบบดั้งเดิม
* **ความไวของกล้อง:** ปรับความเร็วในการหันมุมมองกล้องข้ามไหล่ด้วยตัวคูณเฉพาะ เพื่อชดเชยเอฟเฟกต์พารัลแลกซ์ (Parallax) ของมุมมองบุคคลที่สาม
* **การสลับไหล่:** สลับมุมกล้องจากไหล่ขวาไปซ้ายได้อย่างรวดเร็วด้วยคำสั่งเดียว
* **เป้าเล็งติดตามแบบไดนามิก (Dynamic Crosshair Tracing):** เปิดใช้งานเป้าเล็งวิถีกระสุนจริง เพื่อดูตำแหน่งที่กระสุนของคุณจะตกลงในพื้นที่ 3 มิติอย่างแม่นยำ ปรับแต่งสี RGBA และขนาดได้อย่างเต็มที่!
* **การลดระดับกล้องเมื่อย่อตัว:** ควบคุมได้อย่างสมบูรณ์เมื่อย่อตัว! ปรับแต่งระดับการลดต่ำลงของกล้องเพื่อให้มุมมองของคุณไม่ถูกบังในพื้นที่แคบ ๆ
* **การเปลี่ยนมุมกล้องแบบภาพยนตร์:** เพลิดเพลินกับการเคลื่อนที่ของกล้องที่ราบรื่นเมื่อสลับระหว่างมุมมองบุคคลที่หนึ่งและบุคคลที่สาม พร้อมปรับแต่งความเร็วในการสลับได้!
* **การปรับแต่งอย่างละเอียด:** จัดการออฟเซ็ตแกน X, Y และ Z ของกล้อง, FOV และความเร็วต่างๆ ได้อย่างราบรื่นผ่าน Context Menu ของ Garry's Mod
* **รองรับการแปลภาษาเต็มรูปแบบ (31 ภาษา):** สัมผัสประสบการณ์การแปล UI ภาษาท้องถิ่นคุณภาพสูง พร้อมคำแนะนำช่วยเหลือตามบริบทสำหรับการตั้งค่าทุกส่วน

---

## 🎮 วิธีใช้งาน

### เมนูในเกม
ปรับแต่งกล้องแบบเรียลไทม์ได้โดยไม่ต้องพิมพ์คำสั่งใด ๆ!
1. กดปุ่ม **`C`** ค้างไว้เพื่อเปิด Context Menu ของ Garry's Mod
2. คลิกที่ไอคอน **Third Person Rotating Camera** (มักจะอยู่บนแถบด้านบนหรือในแท็บเฉพาะ)
3. ปรับแถบเลื่อนสำหรับระยะห่างกล้อง (Camera Distance), ขึ้น/ลง (Up/Down), ซ้าย/ขวา (Right/Left) และ FOV
4. ตั้งค่าปุ่มสำหรับการเล็งตามที่คุณถนัด (ค่าเริ่มต้นคือปุ่มคลิกขวา)
5. เปิดหรือปิดใช้งานฟีเจอร์ใหม่ ๆ เช่น Toggle Aim, โหมดไฮบริด (Smart Scope) และการกลับแกน Y ผ่านช่องทำเครื่องหมายได้โดยตรง

![Settings Menu](assets/settings.jpg)

### ปุ่มลัดด่วน
คุณสามารถตั้งค่าปุ่มสำหรับฟังก์ชันที่มีประโยชน์ได้โดยตรงในคอนโซลนักพัฒนา (`~`):

```bash
# เปิด/ปิดกล้องมุมมองบุคคลที่สามด้วยปุ่มเดียว (เช่น ปุ่ม 'X')
bind x "rtp_toggle"

# สลับไหล่อย่างรวดเร็ว (ย้ายกล้องจากขวาไปซ้าย หรือซ้ายไปขวา)
bind v "rtp_switch_shoulder"
```

---

## ⚙️ การตั้งค่า ConVar

สำหรับเจ้าของเซิร์ฟเวอร์หรือผู้ใช้งานขั้นสูง สามารถปรับแต่งตัวแปรทั้งหมดได้ผ่านทางคอนโซล

| ConVar | คำอธิบาย | ค่าเริ่มต้น |
| :--- | :--- | :---: |
| `rtp_enabled` | เปิด (1) หรือ ปิด (0) การใช้งานแอดออน | `1` |
| `rtp_camera_forward` | ควบคุมระยะห่างของกล้องจากผู้เล่น | `50` |
| `rtp_camera_right` | ควบคุมระยะห่างแนวนอนของกล้องจากผู้เล่น | `20` |
| `rtp_camera_up` | ควบคุมระยะห่างแนวตั้งของกล้องจากผู้เล่น | `-10` |
| `rtp_camera_crouch_drop` | ระดับที่กล้องจะลดต่ำลงเมื่อผู้เล่นกำลังย่อตัว (0 = ไม่ลดลง) | `20` |
| `rtp_camera_fov` | กำหนดค่าเป้าหมาย Field of View (มุมมองภาพ) ของกล้อง | `75` |
| `rtp_camera_zoom_fov` | จำนวน FOV ที่จะถูกลบออกขณะกำลังเล็ง | `15` |
| `rtp_camera_sens_multiplier` | ตัวคูณสำหรับความเร็วในการหมุนกล้อง (1.0 = ปกติ, 0.5 = ครึ่งความเร็ว) | `1.0` |
| `rtp_player_rotation_speed`| ควบคุมความเร็วที่โมเดลผู้เล่นหันตัวให้ตรงกับการเคลื่อนไหว | `5` |
| `rtp_aim_rotation_speed` | ความลื่นไหลในการหมุนตัวละครขณะเล็ง (1 = ช้า, 20 = ตอบสนองไว) | `10` |
| `rtp_transition_speed` | ความเร็วของการเคลื่อนที่ของกล้องแบบภาพยนตร์ ตั้งค่าเป็น 0 เพื่อสลับทันที | `4` |
| `rtp_player_aiming_button` | รหัสปุ่มเมาส์/คีย์บอร์ดสำหรับปุ่มเล็ง | `108` |
| `rtp_toggle_aim` | หากเป็น 1 การคลิกปุ่มเล็งจะเป็นการเปิด/ปิดสถานะการเล็ง (ไม่ต้องกดค้าง) | `0` |
| `rtp_smart_scope` | สลับไปเป็นมุมมองบุคคลที่หนึ่งโดยอัตโนมัติขณะที่คุณกำลังเล็ง (โหมดไฮบริด) | `0` |
| `rtp_block_attack2_on_aim` | ป้องกันการยิงโจมตีรองของอาวุธขณะกำลังเล็งในมุมมองบุคคลที่สาม | `0` |
| `rtp_invert_y` | สลับกลับด้านการหมุนแนวตั้ง (Pitch) ของเมาส์ | `0` |
| `rtp_crosshair_hidden_if_not_aiming` | ซ่อนเป้าเล็งที่เป็นค่าเริ่มต้นขณะไม่ได้เล็ง | `0` |
| `rtp_classic_movement_mode` | เปิดใช้โหมดการเคลื่อนไหวแบบคลาสสิก: ล็อกการหมุนโมเดลให้อยู่ในทิศทางเดียวกับกล้อง | `0` |
| `rtp_crosshair_trace_position` | วาดเป้าเล็งแบบไดนามิกแบบกำหนดเองที่แสดงวิถีกระสุนจริง | `0` |
| `rtp_crosshair_size` | ปรับขนาดของเป้าเล็งที่กำหนดเอง | `3` |
| `rtp_crosshair_r`, `g`, `b`, `a` | ปรับสี (RGBA) ของเป้าเล็งที่กำหนดเอง | `255, 230, 0, 240` |

---

## 🧪 การทดสอบสำหรับนักพัฒนา (Busted)

เพื่อให้มั่นใจในความเสถียรของสคริปต์คุณภาพสูงโดยไม่ต้องเข้าเกม โปรเจกต์นี้ได้รับการติดตั้งเฟรมเวิร์กการทดสอบ Lua ที่ชื่อ **Busted** ไว้ทั้งหมด API ของ Garry's Mod ถูกทำ Mock ไว้อย่างปลอดภัยที่ `spec/helpers/gmod_mocks.lua`

**ข้อกำหนดเบื้องต้น:**
คุณต้องทำการติดตั้ง [Lua](https://www.lua.org/) และ [LuaRocks](https://luarocks.org/) ลงในเครื่องของคุณก่อน
```bash
# ติดตั้ง busted ผ่าน luarocks
luarocks install busted
```

**การรันการทดสอบ:**
ไปที่ไดเรกทอรีหลัก (Root directory) ของแอดออนและรันคำสั่ง:
```bash
busted
```

---

## 🛠️ เครดิต & ข้อเสนอแนะ

* **แรงบันดาลใจ:** ระบบกลไกกล้องจากเกม *Haydee*
* **ข้อเสนอแนะ:** หากคุณพบปัญหา บั๊ก หรือต้องการเสนอแนะฟีเจอร์ใหม่ ๆ โปรดแสดงความคิดเห็นไว้ที่ [Steam Workshop Page](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091)

---

## 📄 สัญญาอนุญาต (License)

โปรเจกต์นี้อยู่ภายใต้สัญญาอนุญาต [MIT License](LICENSE) - ดูรายละเอียดเพิ่มเติมได้ในไฟล์ LICENSE