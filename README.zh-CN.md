> 🌐 **Languages:** [English](README.md) | [Русский](README.ru.md) | [ไทย](README.th.md) | [简体中文](README.zh-CN.md)

<div align="center">
  <img src="materials/icon/rotating_third_person.png" alt="Logo" width="256" height="256">
  <h1>第三人称旋转摄像机</h1>
  <p><b>一款为《盖瑞模组》(Garry's Mod) 打造的高度可定制越肩视角摄像机，灵感来源于游戏《海迪》(Haydee)。</b></p>
  
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

**第三人称旋转摄像机 (Third Person Rotating Camera)** 是一款《盖瑞模组》(Garry's Mod) 插件，它彻底重构了游戏默认的第三人称视角。本模组的摄像机机制与游戏 *《海迪》(Haydee)* 完全一致，旨在提供一个精准、响应迅速且高度可定制的越肩视角摄像机系统。

无论你是在沙盒中游玩还是探索地图，这款插件都能为你提供无与伦比的视角控制，最大化你的游戏体验。

---

## ✨ 特性

* **真实的瞄准视角机制：** 你的玩家模型会动态调整，并准确看向你所瞄准的方向。
* **精准的多人游戏预测：** 告别橡皮筋（延迟拉扯）或“自动行走”现象！移动与摄像机角度保持完美的同步与相对计算。
* **智能瞄准镜集成：** 与 TFA 或 CW 2.0 等武器基底完美兼容，无任何冲突。当使用高倍狙击镜瞄准时，摄像机会无缝自动切换至第一人称视角。
* **经典移动模式：** 更喜欢标准《盖瑞模组》的控制方式？启用“经典模式”设置，即可在保持越肩视角的同时，将玩家模型的朝向锁定为摄像机方向。
* **切换式瞄准：** 不想一直按住瞄准键？在设置中启用“切换式瞄准”（Toggle Aim）即可实现单次点击瞄准。
* **支持反转 Y 轴：** 内置坐标轴反转功能，专为习惯传统飞行摇杆式俯仰控制的玩家设计。
* **切换越肩侧：** 只需一条指令，即可快速将摄像机从右肩切换至左肩。
* **动态准星追踪：** 启用真实轨迹准星，可以在 3D 空间中准确看到子弹的落点。
* **丰富的自定义选项：** 可通过《盖瑞模组》的上下文菜单（C键菜单）无缝管理摄像机的 X、Y、Z 轴偏移量、视野（FOV）及速度。
* **全面的本地化支持（31 种语言）：** 享受高质量的母语 UI 翻译，以及针对各项设置的上下文帮助提示。

---

## 🎮 如何使用

### 游戏内菜单
无需输入任何指令即可实时自定义摄像机！
1. 按住 **`C`** 键打开《盖瑞模组》的上下文菜单。
2. 点击 **Third Person Rotating Camera（第三人称旋转摄像机）** 图标（通常位于顶部栏或专用选项卡下）。
3. 调整摄像机距离、上下、左右以及视野（FOV）的滑块。
4. 设置你偏好的瞄准按键（默认为鼠标右键）。
5. 直接通过复选框启用或禁用切换式瞄准、智能瞄准镜以及反转 Y 轴等新功能。

![Settings Menu](assets/settings.jpg)

### 快捷键绑定
你可以直接在开发者控制台（`~`）中绑定常用功能：

```bash
# 使用单个按键（如 'X'）一键开启和关闭第三人称摄像机
bind x "rtp_toggle"

# 快速切换越肩侧（将摄像机从右肩移至左肩，或反之）
bind v "rtp_switch_shoulder"
```

---

## ⚙️ 控制台变量 (ConVar) 配置

对于服主或高级用户，可以通过控制台配置所有变量。

| 控制台变量 (ConVar) | 描述 | 默认值 |
| :--- | :--- | :---: |
| `rtp_enabled` | 启用 (1) 或禁用 (0) 本插件。 | `1` |
| `rtp_camera_forward` | 控制摄像机与玩家之间的距离。 | `50` |
| `rtp_camera_right` | 控制摄像机相对玩家的水平偏移量。 | `20` |
| `rtp_camera_up` | 控制摄像机相对玩家的垂直偏移量。 | `-10` |
| `rtp_camera_fov` | 设置摄像机的目标视野（FOV）。 | `75` |
| `rtp_camera_zoom_fov` | 瞄准时需减去的视野（FOV）数值。 | `15` |
| `rtp_player_rotation_speed`| 控制玩家模型转向以匹配移动方向的速度。 | `5` |
| `rtp_player_aiming_button` | 瞄准按键的鼠标/键盘按键代码。 | `108` |
| `rtp_toggle_aim` | 设为 1 时，点击瞄准键可切换瞄准状态。 | `0` |
| `rtp_smart_scope` | 放大时（FOV < 50）自动禁用第三人称视角。 | `1` |
| `rtp_invert_y` | 反转鼠标垂直俯仰旋转。 | `0` |
| `rtp_crosshair_hidden_if_not_aiming` | 未瞄准时隐藏默认准星。 | `0` |
| `rtp_classic_movement_mode` | 启用经典移动模式：将模型旋转锁定为摄像机方向。 | `0` |
| `rtp_crosshair_trace_position` | 绘制自定义动态准星以显示真实的子弹轨迹。 | `0` |

---

## 🧪 开发者测试 (Busted)

为了在不启动游戏的情况下确保高质量的脚本稳定性，本项目已全面接入 **Busted** Lua 测试框架。《盖瑞模组》的 API 在 `spec/helpers/gmod_mocks.lua` 中被安全地模拟。

**前置条件：**
你需要先在本地机器上安装 [Lua](https://www.lua.org/) 和 [LuaRocks](https://luarocks.org/)。
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

* **灵感来源：** 游戏 *《海迪》(Haydee)* 的摄像机机制。
* **反馈：** 如果你发现任何问题、漏洞（Bug）或有功能需求，请在 [Steam 创意工坊页面](https://steamcommunity.com/sharedfiles/filedetails/?id=1620191091)留言。

---

## 📄 许可证

本项目采用 [MIT 许可证](LICENSE) 授权 —— 有关详细信息，请参阅 LICENSE 文件。