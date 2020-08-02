# mips_platformer
 
Content
-------------

* [General Notes](#general_notes)
* [Project Structure](#project_structure)
* [Naming Structure](#naming_structure)
* [Function Description](#function_description)

***

<a name="general_notes">General Notes</a>
-------------
***

<a name="project_structure">Project Structure</a>
-----------------

### <u>Config</u>

### <u>GUI</u>
Hold all of the GUI realted things. 

### <u>GUI/Bar</u>
Hold all of the bar realted things, like progress bar. The scene for a general bar is in the directory. Also, any extentions of it, exist a directory in it. 

### <u>GUI/Buttons</u>
Hold all of the button realted things, like close button. The scene for a general button is in the directory. Also, any extentions of it, exist a directory in it. 

### <u>GUI/Window</u>
Hold all of the window realted things, like inventory window. The scene for a general window is in the directory. Also, any extentions of it, exist a directory in it. 

### <u>Items/Item</u>
A directory for Item class.

### <u>Items/Item Drop</u>
A directory for item drop scene template.

### <u>Items/Item Inventory</u>
A directory for item inventory scene template.

### <u>Player</u>
Hold all of player realted things.

### <u>Player/HUD</u>
Hold all of player's HUD realted things.

### <u>Player/Sprite</u>
Hold all of player's sprite.

### <u>Player/States</u>
Hold all of player's states.

### <u>Player/Windows</u>
Hold all of player's windows.

### <u>Projectiles/Projectile</u>
A directory for projectile scene template.

### <u>State Machine</u>
A directory for State Machine and State scripts.

| Directory | Explanation |
|---|---|
| Projectiles/Projectile  | A directory for projectile scene template. |
| State Machine  | A directory for State Machine and State scripts. |

***

<a name="naming_structure">Naming Structure</a>
----------------

| Name Of | Writing Type | Note |
|---|---|---|
| Inner function variables  | Camel Case |   |
| Script | Snake Case |   |
| Scene | Snake Case |   |
| Resource | Snake Case |   |
| Function | Snake Case |   |
| Function's arguments | Snake Case |   |
| Signal | Snake Case |   |
| Constants | Other | All uppercase and underscore between words. |
| Export variable | Other | All uppercase and underscore between words. |
| Directory | Other | Spacing between names, uppercase for each word. |

***

<a name="function_description">Function Description</a>
--------------------
Wirting the description before the function definition in the following format:<br/>
<br/>
\# Function Description<br/>
\# @param {type} arg1 - Param Description<br/>
\# @param {type} arg2 - Param Description<br/>
\# .<br/>
\# .<br/>
\# .<br/>
\# @returns {type} - Return Description<br/>
<br/>

#### for example:
<br/>
# Initialize the state machine by the starting state<br/>
# @param {NodePath} start_state - the start which the machine starts on<br/>
<br/>

***

***