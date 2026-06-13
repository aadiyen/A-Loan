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

Godotengine , blender for 3D models , audacity for sounds and music


Development Notes

A few things I learned building this:


NavMesh baking matters — the enemy kept getting stuck in furniture early on. The fix was properly baking the NavigationRegion3D after placing all props in the scene. Took several attempts but resolved it completely.
RNG for both puzzles and patrol — using the same randomized logic for key/passcode puzzles and the enemy's patrol path kept the codebase clean and made both systems feel consistent.
Animating from the enemy's POV — building the death cutscene by placing a camera directly in front of a duplicate enemy model in a separate scene was the most satisfying part of the project. Tweaking the camera shake during the stabbing gave it a real visceral feel.


<img width="540" height="330" alt="Screenshot 2026-05-16 133034" src="https://github.com/user-attachments/assets/b255384b-0869-4de3-ba22-4fa76e2e4e10" />

<img width="540" height="330" alt="Screenshot 2026-05-16 133548" src="https://github.com/user-attachments/assets/9996b57f-2060-40da-95ed-2de2da20831d" />

<img width="540" height="330" alt="Screenshot 2026-04-26 005224" src="https://github.com/user-attachments/assets/959572a7-63e2-4446-9bff-43924d109b2f" />


<img width="1877" height="975" alt="Screenshot 2026-05-01 134526" src="https://github.com/user-attachments/assets/922df689-f886-479b-b97f-14886d982953" />



Play on itch.io

https://adiyen.itch.io/a-loan

Built solo by @aadiyen
