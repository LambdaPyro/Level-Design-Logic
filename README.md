<div align="center">
  <img src="LDL.svg" width="256" height="256">

  <h1 align="center">Level-Design-Logic</h1>
</div>

Tools for setting up basic logic during Level Design. Allows for the set up and wiring of logic solely in the 3D Editor and Inspector. Outputs can be run once, multiple times, be delayed, wait for other outputs, check conditions, switch logic, etc.
<h2> Inspiration and Why </h2>
This project is inspired by logic_outputs found in the Hammer level editor for Source Engine. The goal with bringing similar elements to Godot was to make 3D Level Design more interactive and easier to setup. Without having nodes like these, a level designer would have to rely on making custom scripts and iterate through the script editor. In my opinion, someone who is primarily focused in level design shouldn't have to touch the script editor. I believe that you should have a means to separate logic for unique events in a scene from logic that is for stuff widely used across the game (EX: Turning on a light and playing sound effects vs. Players/NPCs/Managers).
<h2>Installation</h2>
<h3>Git install</h3>
<ol>
  <li>Download the latest version of the plugin from releases.</li>
  <li>Put the Level-Design-Logic folder in your addons folder. (res://addons/Level-Design-Logic)</li>
  <li>Go to your Project Settings, then Plugins, and ensure LevelDesignLogic is enabled. You may need to restart your editor.</li>
</ol>
<h3>AssetLib</h3>
<ol>
  <li>Go to the AssetLib tab in the Godot editor.</li>
  <li>Search for Level-Design-Logic</li>
  <li>Click on the plugin, and a pop-up window should appear. Click download.</li>
  <li>Another window should appear, showing an installation preview. Ensure "ignore asset root" is checked and install.</li>
</ol>
