<img width="2948" height="497" alt="rsg_framework" src="https://github.com/user-attachments/assets/638791d8-296d-4817-a596-785325c1b83a" />

# 💥 rsg-ammo
**Comprehensive ammunition system for RedM using RSG Core.**

![Platform](https://img.shields.io/badge/platform-RedM-darkred)
![License](https://img.shields.io/badge/license-GPL--3.0-green)

> Allows players to use ammo boxes to replenish weapon ammunition.  
> Fully integrated with `rsg-core`, `rsg-inventory`, and `ox_lib` notifications/locales.

---

## 🛠️ Dependencies
- [**rsg-core**](https://github.com/Rexshack-RedM/rsg-core) 🤠  
- [**ox_lib**](https://github.com/overextended/ox_lib) ⚙️ *(notifications & locales)*  
- [**rsg-inventory**](https://github.com/Rexshack-RedM/rsg-inventory) 🎒 *(item management)*  

**Locales:** `en`, `fr`, `es`, `it`, `pt-br`, `el`, `cs`  
**License:** GPL‑3.0  

---

## ✨ Features
- 🎯 **Ammo boxes** for every RDR2 ammo type (revolver, rifle, repeater, shotgun, arrow).  
- 🔁 **Server sync** with periodic save interval (`Config.SaveAmmoInterval`).  
- 🧨 **Custom open time** before applying ammo (`Config.OpenAmmoBoxTime`).  
- ⚙️ **Automatic removal** of ammo box items after use.  
- 🔔 **Notifications via ox_lib** (localized).  
- 🧩 **SQL integration** for persistent ammo tracking (optional).  
- 🌍 **Multi-language support** (EN, FR, ES, IT, PT-BR, EL, CS).  

---

## ⚙️ Configuration (`config.lua`)
```lua
Config = {}

-- Wait time before ammo is applied (in ms)
Config.OpenAmmoBoxTime = 5000

-- Interval to save ammo state (in ms)
Config.SaveAmmoInterval = 60000
```

---

## 📦 Ammo Box Types

| Item Name | Adds To Ammo Type | Description |
|------------|-------------------|--------------|
| `ammo_box_pistol` | `AMMO_PISTOL` | Standard pistol ammo |
| `ammo_box_pistol_express` | `AMMO_PISTOL_EXPRESS` | Express-grade pistol ammo |
| `ammo_box_revolver` | `AMMO_REVOLVER` | Standard revolver ammo |
| `ammo_box_revolver_express` | `AMMO_REVOLVER_EXPRESS` | Express-grade revolver ammo |
| `ammo_box_repeater` | `AMMO_REPEATER` | Standard repeater ammo |
| `ammo_box_repeater_express` | `AMMO_REPEATER_EXPRESS` | Express-grade repeater ammo |
| `ammo_box_rifle` | `AMMO_RIFLE` | Standard rifle ammo |
| `ammo_box_rifle_express` | `AMMO_RIFLE_EXPRESS` | Express-grade rifle ammo |
| `ammo_box_shotgun` | `AMMO_SHOTGUN` | Standard shotgun shells |
| `ammo_box_shotgun_slug` | `AMMO_SHOTGUN_SLUG` | Slug shells |
| `ammo_box_arrow` | `AMMO_ARROW` | Regular arrows |
| `ammo_box_arrow_dynamite` | `AMMO_ARROW_DYNAMITE` | Dynamite arrows |
| `ammo_box_arrow_fire` | `AMMO_ARROW_FIRE` | Fire arrows |
| `ammo_box_arrow_poison` | `AMMO_ARROW_POISON` | Poison arrows |
| `ammo_box_arrow_small_game` | `AMMO_ARROW_SMALL_GAME` | Small-game arrows |

---

## 🔫 Server Logic

- All ammo boxes are registered as **usable items** via `RSGCore.Functions.CreateUseableItem`.  
- When used, the server:
  1. Checks the player’s current ammo count.  
  2. Prevents overflow (shows localized “cannot add more ammo” message).  
  3. Adds ammo using `AddAmmoToPedByType(ped, ammoType, amount)`.
  4. Removes the ammo box from inventory.  
  5. Sends localized success notification (`cl_lang_2`, `cl_lang_3`).

---

## 🎮 Client Logic

- Handles **progress bar and animation** while opening ammo boxes.  
- Plays “opening box” animation and triggers sound FX.  
- Disables movement during the process.  
- Sends completion event to the server.

---

## 🧺 Inventory Items (examples)

Add these to your `items.lua` file:
```lua
ammo_box_revolver       = { name = 'ammo_box_revolver',       label = 'Revolver Ammo Box',       weight = 250, type = 'item', image = 'ammo_box_revolver.png',       unique = false, useable = true,  decay = 0, delete = true, shouldClose = true, description = 'Box of standard revolver ammo' },
ammo_box_revolver_express = { name = 'ammo_box_revolver_express', label = 'Express Revolver Ammo Box', weight = 250, type = 'item', image = 'ammo_box_revolver_express.png', unique = false, useable = true, decay = 0, delete = true, shouldClose = true, description = 'Box of high-quality express revolver ammo' },
ammo_box_rifle          = { name = 'ammo_box_rifle',          label = 'Rifle Ammo Box',          weight = 250, type = 'item', image = 'ammo_box_rifle.png',          unique = false, useable = true,  decay = 0, delete = true, shouldClose = true, description = 'Box of rifle cartridges' },
ammo_box_shotgun        = { name = 'ammo_box_shotgun',        label = 'Shotgun Shell Box',       weight = 250, type = 'item', image = 'ammo_box_shotgun.png',        unique = false, useable = true,  decay = 0, delete = true, shouldClose = true, description = 'Box of shotgun shells' },
ammo_box_arrow          = { name = 'ammo_box_arrow',          label = 'Arrow Box',               weight = 250, type = 'item', image = 'ammo_box_arrow.png',          unique = false, useable = true,  decay = 0, delete = true, shouldClose = true, description = 'Set of crafted arrows' },
```

---

## 🧩 SQL Schema (`rsg-ammo.sql`)
```sql
CREATE TABLE IF NOT EXISTS `player_ammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `ammo_type` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
);
```

---

## 🧠 Troubleshooting
| Issue | Cause | Solution |
|-------|--------|-----------|
| Ammo doesn’t apply | Wrong ammo type in config or item | Check the mapping in `server.lua` |
| “Already full” message | Player reached max ammo | Normal behavior |
| Box not removed | Config or event conflict | Ensure `RemoveItem` is called after `AddAmmoToPedByType` |
| SQL not saving | Not using persistence | Enable `rsg-ammo.sql` and link via server events |

---

## 📂 Installation
1. Place `rsg-ammo` inside `resources/[rsg]`.  
2. Import `rsg-ammo.sql` into your database *(optional)*.  
3. Add to your `server.cfg`:
   ```cfg
   ensure ox_lib
   ensure rsg-core
   ensure rsg-inventory
   ensure rsg-ammo
   ```
4. Restart your server.

---

## 🌍 Locales
Loaded automatically via `lib.locale()`.  
Example strings (English):
```json
{
  "cl_lang_2": "You have added ammo successfully.",
  "cl_lang_3": "You cannot carry any more of this ammo type.",
  "sv_lang_2": "Player %s has used %s."
}
```

---

## 💎 Credits
- **RSG / Rexshack-RedM** — base framework & integration  
- Adapted from early **FRP/VORP ammo logic**, rewritten for RSG Core  
- Community translators (FR, ES, IT, PT-BR, EL, CS)  
- License: GPL‑3.0  
