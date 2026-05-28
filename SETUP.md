# Ratz-Odyssey - Godot 2D Setup Guide

## Project Structure

```
Ratz-Odyssey/
├── scenes/              # All game scenes (.tscn files)
│   └── main.tscn       # Main entry scene
├── scripts/             # GDScript files (.gd)
│   ├── player.gd       # Player character controller
│   └── game_manager.gd # Game manager (singleton)
├── assets/
│   ├── sprites/        # Character and object sprites
│   ├── audio/          # Sound effects and music
│   ├── tilesets/       # Tilemap tilesets
│   └── ui/             # UI elements
├── project.godot       # Godot project configuration
└── README.md           # Project documentation
```

## Getting Started

1. **Open the project in Godot 4.3+**
   - Launch Godot and select "Open Project"
   - Navigate to this folder and select `project.godot`

2. **Run the game**
   - Press `F5` or click the Play button
   - The main scene will load

3. **Project Features**
   - Basic player controller with movement (WASD or arrow keys)
   - GameManager singleton for scene management
   - Organized asset structure ready for sprites, audio, and UI
   - Configured for 1280x720 resolution

## Development Notes

- **Player Script** (`scripts/player.gd`): Extends `CharacterBody2D` with keyboard input handling
- **Game Manager** (`scripts/game_manager.gd`): Singleton for managing scenes and global state
- **Main Scene** (`scenes/main.tscn`): Entry point of the game

## Next Steps

1. Create player sprite and add to the player scene
2. Design and create tilemap for the main level
3. Add NPCs and dialogue system
4. Implement inventory and quest systems
5. Create UI for menus and HUD
