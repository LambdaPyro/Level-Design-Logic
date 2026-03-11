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
<h2>Features</h2>
<ul>
  <li><img src="https://github.com/LambdaPyro/Level-Design-Logic/blob/dev/images/BooleanSwitch-Gizmo.svg" height=24px> BooleanSwitch - Logic Gate that holds a boolean value (switch). This value determines what signal will be sent.</li>
  <li><img src="https://github.com/LambdaPyro/Level-Design-Logic/blob/dev/images/Counter-Gizmo.svg" height=24px> Counter - Can add or subtract to an internal integer, and send that integer to other nodes. Has a minimum and maximum value for unique cases.</li>
  <li><img src="https://github.com/LambdaPyro/Level-Design-Logic/blob/dev/LDL.svg" height=24px> InputOutput - Series of Outputs that are run once an input is recieved.</li>
  <li><img src="https://github.com/LambdaPyro/Level-Design-Logic/blob/dev/images/Interaction.svg" height=42px> Interactable - Simple Input trigger for Level Design Logic. Intended for players to "interact" with scripted sequences</li>
  <li><img src="https://github.com/LambdaPyro/Level-Design-Logic/blob/dev/images/Random-Gizmo.svg" height=20px> Randomizer - Creates a random integer between a minimum and maximum value.</li>
  <li><img src="https://github.com/LambdaPyro/Level-Design-Logic/blob/dev/images/Trigger.svg" height=42px> Trigger - Area3D with better visualization, options to enable and disable types, and check if any node entering has the same name as a given string</li>
</ul>

You can learn more on the official wiki: https://github.com/LambdaPyro/Level-Design-Logic/wiki
