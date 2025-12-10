

---

# 🎮 SA-MP Roleplay – Slap Command System

A lightweight, username-based admin slap system for SA-MP RP servers







---

# ✨ Overview

This script adds a simple but powerful /slap system to any SA-MP Roleplay gamemode.
Admins (verified by username only) can slap a single player or every player online with a high jump effect.

✔ Clean compile 
✔ Lightweight & stable 
✔ Fully RP-friendly 
✔ No admin IDs required — username check only 


---

# 🛠 Features

⚡ `/slap <playerid>` — Launch a player high into the sky

🌐 `/slap all` — Slap every connected player

🔒 Username-based admin verification

📦 Fully standalone (no database required)

📝 100% English documentation

🧩 Works with all SA-MP Roleplay gamemodes

🚀 Instant response & no performance impact



---

# 📥 Installation

Follow these easy steps:



1️⃣ Download the Script

Download the `.pwn` file and place it inside your gamemode or filterscripts folder.




2️⃣ Ensure Required Includes Exist

Make sure you have:

`a_samp`
`sscanf2`

> If you are missing sscanf2, download it from:
➡ https://github.com/maddinat0r/sscanf



Or install via sampctl:

```
sampctl package install maddinat0r/sscanf
```




3️⃣ Add Script to Your Gamemode

If included inside your GM:

`#include "slap_system.pwn"`

If using as a filterscript, add to server.cfg:

`filterscripts slap_system`




4️⃣ Add Your Admin Username(s)

Inside `OnGameModeInit()`:

```
AddAdmin("YourAdminName"); // ← replace this
AddAdmin("SecondAdmin");   // optional
```

You can add unlimited names.




5️⃣ Compile

Compile using your standard Pawn compiler:

pawncc yourgamemode.pwn

If everything is correct — you will get:

✔ No errors
✔ No warnings
✔ Clean compile




6️⃣ Start Your Server

Run SA-MP server and test:

`/slap <playerid>`
`/slap all`


---

# 💡 Usage

🟦 Slap a Single Player

`/slap 12`

Player with ID 12 will be launched upward.

🟨 Slap Everyone

`/slap all`

All connected players receive the slap effect.

🔐 Permission System

Only users whose username matches your admin list can use the command.


---

# 🔧 Tips for Best Use

✏ Change admin names exactly as they appear in-game (case-insensitive)

🚫 Do not put spaces in admin usernames
```
Example:
❌ "John Doe"
✔ "John_Doe"
```

🛠 If you want multiple admins → just add more `AddAdmin("username");` lines

⚙ You can safely use this script in live RP servers

🧹 No database needed — everything runs standalone



---

# 📌 What You Need

Requirement	Description

SA-MP Server 0.3.7 / open.mp	Works on both
Pawn Compiler	Standard pawncc is enough
sscanf Plugin	Needed for command parsing
Basic Server Knowledge	How to compile & run SA-MP



---

# 📄 License

This project is free to use, modify, and include in any SA-MP server.


---

# ⭐ Support & Contribution

If you like this script, consider giving the repository a ⭐ on GitHub!
Contributions & improvements are always welcome.


---
