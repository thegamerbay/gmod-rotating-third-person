> 🌐 **语言:** [English](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/README.md) | [Русский](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.ru.md) | [ไทย](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.th.md) | [简体中文](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.zh.md) | [Español](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.es.md) | [العربية](https://github.com/thegamerbay/gmod-rotating-third-person/blob/master/assets/README.ar.md)

<div align="center">
  <img src="materials/icon/rotating_third_person.png" alt="Logo" width="256" height="256">
  <h1>第三人称旋转摄像机</h1>
  <p><b>一款为《盖瑞模组》(Garry's Mod) 打造的高度可定制的越肩视角摄像机，灵感来源于游戏《Haydee》。</b></p>
  
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

## 📖 概述

**第三人称旋转摄像机 (Third Person Rotating Camera)** 是一款完全重塑《盖瑞模组》默认第三人称视角的插件。本模组的摄像机机制与游戏 *Haydee* 完全一致，旨在提供一个精准、响应迅速且高度可定制的越肩视角摄像机系统。

无论您是在沙盒中游玩还是在探索地图，该插件都能为您提供无与伦比的视角控制体验，从而最大化您的游戏乐趣。

---

## ✨ 特性

* **真实的瞄准视角机制：** 您的玩家模型会动态调整，并且确切地看向您瞄准的方向。
* **瞄准旋转平滑度：** 可精确配置在使用武器瞄准机制时，角色身体转向摄像机方向的平滑度。
* **精准的多人游戏预测：** 不再有网络延迟导致的橡皮筋效应或“自动行走”！移动会与摄像机角度保持完美的同步与计算。
* **混合模式 (智能开镜)：** 与 TFA 或 CW 2.0 等武器基础库完美兼容，无任何冲突。当您尝试瞄准时，摄像机会无缝自动过渡到第一人称视角。
* **经典移动模式：** 偏好标准的《盖瑞模组》操作方式？启用经典模式设置，即可在保留越肩视角的同时，将玩家模型的朝向锁定为摄像机方向。
* **切换式瞄准：** 不想一直按住瞄准键？在设置中启用切换式瞄准，即可实现单击瞄准。
* **支持反转 Y 轴：** 内置视角的轴反转功能，专为偏好传统飞行摇杆式俯仰控制的玩家设计。
* **摄像机灵敏度：** 可通过专属的乘数设置调整越肩视角的转动速度，以补偿第三人称带来的视差效应。
* **肩键切换：** 只需一条指令，即可在左右肩之间快速切换摄像机视角。
* **动态准星追踪：** 启用真实弹道准星，在 3D 空间中准确显示子弹的落点。完全支持自定义 RGBA 颜色和大小设置！
* **下蹲摄像机下沉：** 在下蹲时保持完全控制！自定义摄像机下降的幅度，以确保在狭窄空间内视线无阻。
* **电影级摄像机过渡：** 在第一人称与第三人称视角之间切换时，享受平滑、插值的摄像机飞行体验。支持自定义过渡速度！
* **丰富的自定义选项：** 可通过《盖瑞模组》的上下文菜单无缝管理摄像机的 X、Y、Z 轴偏移量、视野 (FOV) 以及速度。
* **全面的本地化支持 (31种语言)：** 享受高质量的原生 UI 翻译，以及针对各项设置的上下文感知帮助提示。

---

## 🎮 使用方法

### 游戏内菜单
无需输入任何指令即可实时自定义摄像机！
1. 按住 **`C`** 键打开《盖瑞模组》的上下文菜单。
2. 点击 **Third Person Rotating Camera**（第三人称旋转摄像机）图标（通常位于顶部栏或专属标签页下）。
3. 调整摄像机距离、上下、左右以及 FOV（视野）的滑块。
4. 设置您偏好的瞄准按键（默认为鼠标右键）。
5. 直接通过复选框启用或禁用切换瞄准、混合模式 (智能开镜) 以及反转 Y 轴等新功能。

![Settings Menu](assets/settings.jpg)

### 快捷键绑定
您可以在开发者控制台 (`~`) 中直接绑定实用的功能：

```bash
# Toggle the third-person camera ON and OFF with a single key (e.g., 'X')
bind x "rtp_toggle"

# Quickly swap shoulders (moves camera from right to left, or vice versa)
bind v "rtp_switch_shoulder"
```

---

## ⚙️ 控制变量 (ConVar) 配置

对于服务器服主或高级用户，可以通过控制台配置所有变量。

| 控制变量 (ConVar) | 描述 | 默认值 |
| :--- | :--- | :---: |
| `rtp_enabled` | 启用 (1) 或禁用 (0) 插件。 | `1` |
| `rtp_camera_forward` | 控制摄像机与玩家之间的距离。 | `50` |
| `rtp_camera_right` | 控制摄像机相对于玩家的水平偏移量。 | `20` |
| `rtp_camera_up` | 控制摄像机相对于玩家的垂直偏移量。 | `-10` |
| `rtp_camera_crouch_drop` | 玩家下蹲时摄像机下降的幅度。（0 = 不下降） | `20` |
| `rtp_camera_fov` | 设置摄像机的目标视野 (FOV)。 | `75` |
| `rtp_camera_zoom_fov` | 瞄准时减少的视野 (FOV) 数值。 | `15` |
| `rtp_camera_sens_multiplier` | 摄像机旋转速度的乘数（1.0 = 正常，0.5 = 减半）。 | `1.0` |
| `rtp_player_rotation_speed`| 控制玩家模型为匹配移动而转向的速度。 | `5` |
| `rtp_aim_rotation_speed` | 瞄准时角色旋转的平滑度（1 = 缓慢，20 = 快速响应）。 | `10` |
| `rtp_transition_speed` | 电影级摄像机飞行的速度。设置为 0 为瞬间切换。 | `4` |
| `rtp_player_aiming_button` | 瞄准按钮对应的鼠标/键盘键码。 | `108` |
| `rtp_toggle_aim` | 如果为 1，点击瞄准按钮可切换瞄准状态。 | `0` |
| `rtp_smart_scope` | 瞄准时自动切换至第一人称视角（混合模式）。 | `0` |
| `rtp_block_attack2_on_aim` | 在第三人称瞄准时，阻止触发武器的次要攻击（右键攻击）。 | `0` |
| `rtp_invert_y` | 反转鼠标垂直俯仰旋转（反转 Y 轴）。 | `0` |
| `rtp_crosshair_hidden_if_not_aiming` | 不瞄准时隐藏默认准星。 | `0` |
| `rtp_classic_movement_mode` | 启用经典移动模式：将模型旋转锁定为摄像机方向。 | `0` |
| `rtp_crosshair_trace_position` | 绘制自定义的动态准星，显示真实的子弹弹道。 | `0` |
| `rtp_crosshair_size` | 调整自定义准星的大小。 | `3` |
| `rtp_crosshair_r`, `g`, `b`, `a` | 调整自定义准星的颜色 (RGBA)。 | `255, 230, 0, 240` |

---

## 🧪 开发者测试 (Busted)

为了在不启动游戏的情况下确保高质量的脚本稳定性，本项目全面引入了 **Busted** Lua 测试框架。《盖瑞模组》的 API 已在 `spec/helpers/gmod_mocks.lua` 中进行了安全的模拟 (Mock)。

**前提条件：**
您需要在本地计算机上安装 [Lua](https://www.lua.org/) 和 [LuaRocks](https://luarocks.org/)。
```bash
# Install busted via luarocks
luarocks install busted
```

**运行测试：**
导航到插件的根目录并运行：
```bash
busted
```

---

## 🛠️ 鸣谢与反馈

* **灵感来源：** 游戏 *Haydee* 的摄像机机制。
* **反馈意见：** 如果您发现任何问题、漏洞，或者有任何功能请求，请在 [Steam 创意工坊页面](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091) 留言。

---

## 📄 许可证

本项目基于 [MIT 许可证](LICENSE) 进行开源 - 详情请参阅 LICENSE 文件。