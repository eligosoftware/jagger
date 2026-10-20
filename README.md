<div align="center">
  <img src="Jagger-logo.svg" alt="Jagger Logo" width="84" height="84">
  <h1>Jagger</h1>
  <p><strong>Offline-first Kanban Task Manager, Agile Sprint Tracker &amp; Time Logger</strong></p>
  <p>Zero cloud · Single-file PC web app · Air-gapped QR sync with Android · Bilingual (EN / DE)</p>
</div>

---

## Overview

**Jagger** is a fast, self-contained task and project management application designed to work **100% offline** with no servers, accounts, or external dependencies.

The desktop application lives entirely inside a single file (`Jagger.html`) that runs in any modern browser or in its own native-like desktop window via Microsoft Edge's app mode. It pairs with **Jagger for Android**, exchanging tasks and changes directly between devices using animated QR codes (`JG2` sync protocol).

---

## Key Features

### 📋 Kanban Boards & WIP Limits
- **Standard & Custom Workflows**: Ships with *Backlog*, *To do*, *In progress*, *Review*, and *Done* boards. Create, reorder, recolor, or customize columns at any time.
- **Work-in-Progress (WIP) Limits**: Set a maximum task count per board (e.g., max 3 in *In progress*) to immediately highlight workflow bottlenecks when limits are exceeded.
- **Completion Tracking**: Any board can be marked as a "Completed" column, automatically stamping tasks with a completion timestamp and stopping active timers when moved there.

### 🗂️ Rich Task Cards
- **Structured Metadata**: Sequential task IDs (`T-001`, `T-002`, …), 3-tier priority levels (`Prio 1`–`Prio 3`), start dates, deadlines with relative due/overdue badges, and hour estimates.
- **Subtasks & Checklists**: Interactive checklists with inline progress bars both on the board card and inside the task modal.
- **Bottleneck / Blocked Flag**: Mark tasks as blocked and display the blocking reason prominently on the card in red.
- **Timestamped Notes**: Keep a chronological log of updates and context notes on every task.
- **Instant Filtering & Sorting**: Full-text search across titles, descriptions, subtasks, block reasons, and notes; one-click toolbar filters for *Prio 1*, *Overdue*, and *Bottlenecks*; sort manually via drag-and-drop, by priority, or by deadline.

### 🏁 Agile Sprints & Burndown Charts
- **Sprint Lifecycle**: Plan upcoming sprints with start/end dates and sprint goals, start an active sprint, and complete sprints with guided rollover of unfinished tasks to the next sprint or backlog.
- **Live Burndown Chart**: Renders an inline SVG burndown chart comparing the ideal burndown line against actual remaining open tasks day by day.
- **Sprint Scoping**: Filter the entire Kanban board by active sprint, planned/completed sprints, or unassigned backlog tasks.

### ⏱️ Live Time Tracking
- **One-Click Stopwatch**: Start and stop a live timer directly from any task card or inside the task modal.
- **Header Timer Pill & Tab Clock**: Shows the currently running task and elapsed time in the top bar and browser window title (`⏱ 0:12:34 – Jagger`).
- **Manual Time Entries & Estimates**: Log hours/minutes manually for today or past dates and track progress visually against estimated hours (with over-estimate alerts).

### 📱 Air-Gapped PC ↔ Phone Sync (`JG2` Protocol)
- **No Cloud or Wi-Fi Required**: Synchronizes data directly between PC and phone via QR codes or local sync files.
- **Delta & Full Sync**: After the initial full sync, only modified tasks and deletion tombstones since the last confirmed sync are transmitted—typically just 1–2 QR codes.
- **Conflict Resolution**: Per-task last-write-wins (`updatedAt` timestamp) merging, automatic task renumbering if both devices created tasks with the same number, and automatic pre-sync restore points.
- **Technical Pipeline**: Compact positional JSON $\rightarrow$ `deflate` compression $\rightarrow$ RFC 9285 Base45 encoding $\rightarrow$ CRC-32 checksummed chunks (`JG2:<SID>:<i>:<n>:<CRC32>:<base45>`).

### 🛡️ Multi-Tier Data Safety & Backups
1. **Browser Storage (`localStorage`)**: Saves every change automatically and syncs live across open tabs.
2. **100-Step Undo / Redo**: Full in-memory history (`Ctrl+Z` / `Ctrl+Y`) that groups continuous typing into clean undo steps.
3. **Hourly Restore Points (`IndexedDB`)**: Automatically captures snapshots while you work (retaining all snapshots from the last 48 hours and one per day up to the configured retention period of 7–90 days).
4. **Automatic Daily Folder Backups (`File System Access API`)**: In Edge or Chrome, pick a local or network drive folder once—Jagger automatically maintains daily `Jagger_YYYY-MM-DD.json` files as you work and prunes expired backups.
5. **Manual JSON Export / Import**: Save and restore full portable `.json` backups at any time, with configurable backup reminder banners.

### 📊 Native Excel (`.xlsx`) Export
- Generates a styled, multi-sheet `.xlsx` workbook completely offline using a custom-built ZIP and OpenXML generator—no third-party spreadsheet library required.
- Includes **6 worksheets** with frozen header rows, auto-filters, priority color fills, and proper Excel date/number formatting:
  1. **Tasks**
  2. **Subtasks**
  3. **Time log**
  4. **Notes**
  5. **Boards**
  6. **Sprints**

### 🌐 Bilingual & Theme-Aware
- Switchable between **English (`EN`)** and **German (`DE`)** at any time without reloading.
- Automatic **Light & Dark Mode** following your operating system theme (`prefers-color-scheme`).

---

## Getting Started (PC / Desktop)

### Option 1: Run as a Standalone Desktop App (Windows + Edge)
1. Double-click **`Start Jagger.bat`** to open `Jagger.html` in its own dedicated Microsoft Edge app window (`--app` mode).
2. *(Optional)* Double-click **`Create Desktop Shortcut.bat`** once to create a **Jagger** shortcut with `Jagger.ico` on your Windows Desktop.

### Option 2: Open in Any Browser
Simply open **`Jagger.html`** in Microsoft Edge, Google Chrome, Firefox, or Safari.
*(Note: Microsoft Edge or Google Chrome is recommended to use automatic daily folder backups via the File System Access API.)*

---

## Keyboard Shortcuts

| Shortcut | Context | Action |
| :--- | :--- | :--- |
| `N` | Board view | Create a new task |
| `Ctrl+Z` / `Cmd+Z` | Global (outside inputs) | Undo last change |
| `Ctrl+Y` / `Ctrl+Shift+Z` | Global (outside inputs) | Redo change |
| `Escape` | Any open modal | Close modal & save |
| `Enter` | Column quick-add input | Create task in that column |
| `Enter` | Focused task card | Open task details modal |
| `Enter` | Subtask input (`+ Add a subtask`) | Add subtask |
| `Ctrl+Enter` / `Cmd+Enter` | Note textarea | Add timestamped note |

---

## Syncing with Jagger for Android

- **PC → Phone**:
  1. In `Jagger.html`, click **Sync** (`PC → Phone`).
  2. On the Android app, tap the QR icon → **Scan codes from PC** and point the camera at the screen. The animated QR codes can be scanned in any order.
- **Phone → PC**:
  1. On the Android app, go to **Sync → Create QR picture for the PC** (or **Send as file**).
  2. Transfer the image at full resolution (or the JSON sync file) to your PC via email, OneDrive, or USB.
  3. Drag and drop the image/file into `Jagger.html` under **Sync → Phone → PC** (or paste with `Ctrl+V`).

### Building the Android App
The companion Android project (`JaggerAndroid`, packaged in `files.zip`) is written in **Kotlin** with **Jetpack Compose**.

1. Extract the Android project folder and open it in **Android Studio** (Ladybug 2024.2 or newer): *File → Open*.
2. Let Gradle sync (Gradle 8.11.1, Android Gradle Plugin 8.7.3, Kotlin 2.0.21, Compose, CameraX, ML Kit, ZXing).
3. Connect a phone with USB debugging (Android 8.0 / API 26+) or start an emulator and press **Run**, or build an APK via *Build → Build App Bundle(s) / APK(s) → Build APK(s)*.

#### Android Project Structure
- `app/src/main/java/com/jagger/tasks/core/`: Data model, `JG2` sync format, merge logic, change tracking, and Excel export (kept in step with `JSYNC` in `Jagger.html`).
- `app/src/main/java/com/jagger/tasks/data/`: Local storage and restore points.
- `app/src/main/java/com/jagger/tasks/ui/`: Jetpack Compose screens, ViewModel, CameraX/ML Kit scanner, and QR image rendering.
- `app/src/main/res/`: English (`values`) and German (`values-de`) string resources, icons, and themes.

---

## Repository Structure

```text
├── Jagger.html                  # Complete standalone PC web application
├── Start Jagger.bat             # Launches Jagger.html in Edge app-window mode
├── Create Desktop Shortcut.bat  # Creates a Windows Desktop shortcut with Jagger.ico
├── Jagger.ico                   # Windows application icon
├── Jagger-logo.svg              # Vector brand logo
├── Jagger-logo.png              # Raster brand logo
├── files.zip                    # Companion Jagger for Android source archive
├── Backups/                     # Local folder for daily/manual JSON backups
└── README.md                    # Project documentation
```
