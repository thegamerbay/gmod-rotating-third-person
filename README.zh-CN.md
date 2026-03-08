> 🌐 **Languages:** [English](README.md) | [Русский](README.ru.md) | [ไทย](README.th.md) | [简体中文](README.zh-CN.md)

<div align="center">
  <img src="materials/icon/rotating_third_person.png" alt="Logo" width="256" height="256">
  <h1>第三人称旋转摄像机</h1>
  <p><b>一款为《盖瑞模组》(Garry's Mod) 打造的高度可定制越肩视角摄像机，灵感源自《Haydee》。</b></p>
  
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

**第三人称旋转摄像机** 是一个《盖瑞模组》插件，它彻底重塑了游戏默认的第三人称视角。本模组的设计完全参照了游戏《Haydee》的摄像机机制，旨在提供一个精准、响应迅速且高度可定制的越肩视角摄像机系统。

无论你是在进行沙盒游玩还是探索地图，这个插件都能为你提供无与伦比的视角控制，最大化你的游戏体验。

---

## ✨ 特性

* **真实的瞄准视角机制：** 你的玩家模型会动态调整，准确看向你所瞄准的方向。
* **精准的多人游戏预测：** 不再有橡胶带效应（卡顿拉扯）或“自动行走”！移动完美同步，并根据摄像机角度进行精确计算。
* **智能瞄准镜集成：** 与 TFA 或 CW 2.0 等武器库兼容且无冲突。通过高倍狙击镜瞄准时，摄像机会无缝自动切换到第一人称视角。
* **经典移动模式：** 更喜欢《盖瑞模组》的标准操作方式？开启经典模式设置，可将你的玩家模型锁定至摄像机方向，同时保留越肩视角。
* **切换式瞄准：** 不喜欢一直按住瞄准键？可以在设置中开启“切换式瞄准”，实现单次点击即可持续瞄准。
* **支持反转 Y 轴：** 内置反转轴选项，专为偏好传统飞行摇杆式俯仰控制的玩家设计。
* **摄像机灵敏度：** 通过专门的倍率设置调整越肩视角的转动速度，以补偿第三人称的视差效应。
* **切换肩部视角：** 使用单一命令即可将摄像机从右肩快速切换到左肩。
* **动态准星追踪：** 开启真实弹道准星，即可在 3D 空间中准确看到子弹的落点。
* **丰富的自定义选项：** 可通过《盖瑞模组》的上下文菜单（C键菜单）无缝管理摄像机的 X、Y、Z 轴偏移、视野（FOV）及速度。
* **全面的本地化支持（31 种语言）：** 为每项设置提供高质量的原生 UI 翻译和上下文帮助提示。

---

## 🎮 使用方法

### 游戏内菜单
无需输入任何命令即可实时自定义摄像机！
1. 按住 **`C`** 键打开《盖瑞模组》的上下文菜单。
2. 点击 **Third Person Rotating Camera（第三人称旋转摄像机）** 图标（通常位于顶栏或专属选项卡下）。
3. 调整摄像机距离、上下、左右偏移以及视野（FOV）的滑块。
4. 设置你偏好的瞄准按键（默认为鼠标右键）。
5. 直接通过复选框启用或禁用诸如切换式瞄准、智能瞄准镜和反转 Y 轴等新特性。

![Settings Menu](assets/settings.jpg)

### 快捷键绑定
你可以直接在开发者控制台 (`~`) 中绑定实用的功能：

```bash
# 使用单个按键（如 'X'）切换第三人称摄像机的开启与关闭
bind x "rtp_toggle"

# 快速切换肩部视角（将摄像机从右肩向左肩移动，反之亦然）
bind v "rtp_switch_shoulder"
```

---

## ⚙️ 控制台变量 (ConVar) 配置

对于服务器服主或高级用户，所有变量都可以通过控制台进行配置。

| 控制台变量 | 描述 | 默认值 |
| :--- | :--- | :---: |
| `rtp_enabled` | 切换插件的开启 (1) 或关闭 (0)。 | `1` |
| `rtp_camera_forward` | 控制摄像机与玩家之间的距离。 | `50` |
| `rtp_camera_right` | 控制摄像机相对于玩家的水平偏移。 | `20` |
| `rtp_camera_up` | 控制摄像机相对于玩家的垂直偏移。 | `-10` |
| `rtp_camera_fov` | 设置摄像机的目标视野（FOV）。 | `75` |
| `rtp_camera_zoom_fov` | 瞄准时减少多少视野（FOV）。 | `15` |
| `rtp_camera_sens_multiplier` | 摄像机旋转速度的倍率（1.0 = 正常，0.5 = 半速）。 | `1.0` |
| `rtp_player_rotation_speed`| 控制玩家模型转向以匹配移动的速度。 | `5` |
| `rtp_player_aiming_button` | 瞄准键的鼠标/键盘键值。 | `108` |
| `rtp_toggle_aim` | 设为 1 时，点击瞄准键可切换瞄准状态。 | `0` |
| `rtp_smart_scope` | 放大时（FOV < 50）自动禁用第三人称视角。 | `1` |
| `rtp_invert_y` | 反转鼠标垂直俯仰旋转。 | `0` |
| `rtp_crosshair_hidden_if_not_aiming` | 未瞄准时隐藏默认准星。 | `0` |
| `rtp_classic_movement_mode` | 启用经典移动模式：将模型旋转锁定为摄像机方向。 | `0` |
| `rtp_crosshair_trace_position` | 绘制一个自定义的动态准星，显示真实的子弹弹道。 | `0` |

---

## 🧪 开发者测试 (Busted)

为了在不启动游戏的情况下确保高质量的脚本稳定性，本项目已全面接入 **Busted** Lua 测试框架。《盖瑞模组》的 API 在 `spec/helpers/gmod_mocks.lua` 中进行了安全的模拟。

**先决条件：**
你需要在机器上安装 [Lua](https://www.lua.org/) 和 [LuaRocks](https://luarocks.org/)。
```bash
# 通过 luarocks 安装 busted
luarocks install busted
```

**运行测试：**
导航至插件的根目录并运行：
```bash
busted
```

---

## 🛠️ 鸣谢与反馈

* **灵感来源：** 游戏《Haydee》的摄像机机制。
* **反馈：** 如果你发现任何问题、漏洞或有功能需求，请在 [Steam 创意工坊页面](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091) 留言。

---

## 📄 许可证

本项目基于 [MIT 许可证](LICENSE) 授权 - 详情请参见 LICENSE 文件。