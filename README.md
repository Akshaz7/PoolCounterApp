# 🎱 Pool Counter App

**A modern, minimal, and customizable score tracker for pool games — built in SwiftUI.**

---

## 🚀 Overview

**Pool Counter** is a sleek iOS app designed to make keeping score for billiards (pool) games effortless, whether you’re at the pub or in a tournament. Inspired by the minimal, “card-style” UI of popular workout trackers like Dropset, this project demonstrates both clean SwiftUI design and robust local data management.

---

## ✨ Features

- **Add/Remove Players:** Dynamically add players for each session. Remove players with confirmation dialogs for safety.
- **Player Profiles:** Saved, persistent profiles for regular players — keep long-term stats for match wins and frames won.
- **Session-based Scoring:** Track frames during each match session. Finalize a session with a single tap and stats are added to player profiles.
- **Error-proofing:** All session changes are confirmed with alerts to prevent accidental deletions or resets.
- **Modern UI:** Minimalist, “card-based” interface, optimized for usability and clarity — perfect for quick score updates between shots.
- **Local Data Persistence:** Player stats and profiles are stored securely on-device using `UserDefaults` with `Codable` structs.
- **SwiftUI Best Practices:** Built entirely in SwiftUI, using state management, bindings, and custom structs.

---

## 📱 Screenshots

![image](https://github.com/user-attachments/assets/77993ba8-f84d-47a1-931b-dd759907facb)
![image](https://github.com/user-attachments/assets/46d1ae7e-d14e-473c-a038-52205a7228c5)
![image](https://github.com/user-attachments/assets/7a9f1e83-d5f6-4c40-93cc-72dadacecf78)




---

## 🛠️ Tech Stack

- **Language:** Swift
- **Framework:** SwiftUI
- **Persistence:** UserDefaults (Codable)
- **Platform:** iOS

---

## ⚡ How It Works

1. **Start a Session:** Tap “Add” to select from your saved player profiles.
2. **Score the Match:** Tap plus/minus to update frame scores for each player.
3. **End the Session:** When you’re done, hit “End Session” to update lifetime stats for all players and reset for the next game.
4. **Stay Organized:** See saved profiles, all-time stats, and enjoy the fast, tap-friendly interface.

---

## 📦 Getting Started

1. **Clone this repo:**
   ```bash
   git clone https://github.com/Akshaz7/PoolCounterApp.git
2.	Open in Xcode:
Open PoolCounterApp.xcodeproj or PoolCounterApp.xcworkspace.
3.	Build & Run:
Choose your simulator or plug in your iPhone and hit the play button!

---

🎯 Why I Built This

This project is more than just a score tracker — it’s a demonstration of my skills in SwiftUI, user experience design, and persistent data management for iOS. I built Pool Counter from scratch to solve a real problem for myself and friends, and to showcase my ability to turn design ideas into production-ready code.

---
🛣️ Roadmap / Planned Features

- Game history and session logs (see every match ever played)
- Export stats to CSV or PDF
- In-app charts and leaderboards
- Light/Dark mode toggle
- Support for other cue sports (snooker, 9-ball, etc)
- Sync profiles and stats across devices (iCloud)
- Achievements/badges for milestones

---
  

👋 About Me

I’m a passionate iOS developer who loves building elegant solutions to everyday problems. Interested in chatting about SwiftUI, product design, or the perfect pool break?
Let’s connect!

---

📄 License

MIT License

---

Built for fun, feedback, and the future of simple scorekeeping.
