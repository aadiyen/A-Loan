A-Loan


A first-person 3D horror game built in Godot 4 — my first complete 3D game.

<img width="540" height="330" alt="A-Loan game trailer" src="https://github.com/user-attachments/assets/6fc3f145-9256-4643-8f14-b2ae8ae7ea05" />



Overview

A-Loan is a first-person 3D horror game where the player must navigate a dark, atmospheric house while evading a pursuing enemy. The game emphasizes immersion through environmental storytelling, reactive interactions, and tense AI-driven encounters.

This was my first fully shipped 3D game — built entirely solo, from modeling every asset in Blender to designing the AI, puzzle systems, and cutscenes.

Play on itch.io


Features

Enemy AI


Patrol system driven by RNG — the enemy takes randomized routes through the house, keeping each run unpredictable
Vision detection via RayCast3D — the enemy begins pursuit when the player enters its line of sight
Chase and disengage logic — the enemy chases for a fixed duration before returning to patrol
A dedicated kill raycast, enabled only during active chase, handles player death detection


Player Death Sequence


Custom stabbing animation built by duplicating the enemy model into a separate scene, placing a camera in front of it, and keyframing the attack using AnimationPlayer
Camera movement tweaked throughout the animation for a dynamic, cinematic feel


Interaction System


Contextual crosshair — only appears when the player is near an interactable object
Fully animated doors and drawers
Key and passcode puzzle mechanics powered by RNG — same underlying system as the enemy patrol


Intro Cutscene


A car driving down a dark highway at night, leading into the game's opening — created with Godot's Movie Maker Mode and synced audio


Audio


Unique sound effects synced to individual interactions throughout the game


Settings


In-game settings menu to adjust graphics quality, FPS cap, anti-aliasing, and more



Tech Stack

ToolUsageGodot 4Game engine, GDScriptBlenderAll 3D models and assetsNavigationAgent3DEnemy pathfinding and NavMeshRayCast3DEnemy vision and kill detectionAnimationPlayerDoor/drawer animations, death sequenceMovie Maker ModeIntro cutscene


Development Notes

A few things I learned building this:


NavMesh baking matters — the enemy kept getting stuck in furniture early on. The fix was properly baking the NavigationRegion3D after placing all props in the scene. Took several attempts but resolved it completely.
RNG for both puzzles and patrol — using the same randomized logic for key/passcode puzzles and the enemy's patrol path kept the codebase clean and made both systems feel consistent.
Animating from the enemy's POV — building the death cutscene by placing a camera directly in front of a duplicate enemy model in a separate scene was the most satisfying part of the project. Tweaking the camera shake during the stabbing gave it a real visceral feel.



Screenshots


Show ImageShow ImageShow ImageShow Image


Links

Play on itch.io




Built solo by @adiyen
