# 🎮 GameVerse – 8086 Assembly Console Game

GameVerse is a console-based game project developed using **Intel 8086 Assembly Language** as an academic project.  
The project contains **two interactive games** implemented completely at a low level, without using DOSBox. 

---

## 🧩 Included Games

This project contains the following two games:

1. **Memory Match Game**  
2. **Magic Square Box Game**

Both games run inside the console and are controlled using keyboard input.

---

## 1️⃣ Memory Match Game

A two-player memory-based game.

### Rules:
- Player 1 sets a 3×3 grid using numbers from **1 to 9**.
- Player 2 must carefully memorize the grid.
- The screen is cleared after memorization.
- Player 2 then fills another 3×3 grid from memory.

### Winning Logic:
- If **Correct > Wrong → Player 1 Wins**
- If **Wrong > Correct → Player 2 Wins**

---

## 2️⃣ Magic Square Box Game

A logic-based mathematical puzzle.

### Rules:
- The player must fill a 3×3 grid using numbers **1 to 9**.
- No repeated numbers are allowed.
- The sum of:
  - Each row
  - Each column
  - Both diagonals  
  must be equal.

### Result:
- If all sums are equal → **Magic Box Valid (You Win)**
- Otherwise → **Not a Magic Box (Try Again)**

