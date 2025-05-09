# pokegame
# 🎮 PokéGame: A start to The Ultimate Pokémon Guessing Game

**Test your knowledge of Pokémon with this fast-paced guessing challenge!**  
Compete with others, track your score, and climb the daily leaderboard.

---

## 🎥 Gameplay Preview
*(Click to watch the full demo of how it works!)*
https://youtube.com/shorts/axyraWmSrW4?feature=share

---

## 🕹️ How It Works

1. **Login or Create an Account**
    - Secure Firebase Auth handles your login.
    - Your score is saved and linked to your account.

2. **Guess the Pokémon**
    - You'll be shown a **silhouetted Pokémon** image.
    - Enter the name — be quick and accurate!

3. **Scoring & Leaderboards**
    - Each correct answer earns points.
    - See today’s top scorers.
    - Compete daily for a new high score.

---

## 🧠 Built With

- **Flutter** – Frontend UI
- **Firebase Auth** – User authentication
- **Cloud Firestore** – Real-time database for scores
- **PokéAPI** – Source of all Pokémon data

---

## 📊 Data Tracked per User

- UID / Email / Username
- Score
- Timestamp of score entry
- Highest streak achieved

## 🚀 Try It Yourself

1. Clone the repo.
2. Run it on Android:
   ```bash
   fvm flutter pub get
   fvm flutter run
