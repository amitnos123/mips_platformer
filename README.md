# mips_platformer
 
General Notes
-------------
***

Project Structure
-----------------

### <u>Config</u>

### <u>GUI</u>

### <u>Items</u>

### <u>Player</u>

### <u>Projectiles</u>

### <u>State Machine</u>
***

Naming Structure
----------------

| Name Of | Writing Type | Comment |
|---|---|---|
| Inner function variables  | [Camel Case](#camel_case) |   |
| Script | [Snake Case](#snake_case) |   |
| Scene | [Snake Case](#snake_case) |   |
| Resource | [Snake Case](#snake_case) |   |
| Function | [Snake Case](#snake_case) |   |
| Function's arguments | [Snake Case](#snake_case) |   |
| Signal | [Snake Case](#snake_case) |   |
| Constants | [Other](#other) | All uppercase and underscore between words. |
| Export variable | [Other](#other) | All uppercase and underscore between words. |
| Directory | [Other](#other) | Spacing between names, uppercase for each word. |

### <a name="camel_case"><u>Camel Case</u></a>
* Inner function variables 


### <a name="snake_case"><u>Snake Case</u></a>
* Script's name
* Scene's name
* Resource's name
* Function
* Function's arguments
* Signal


### <a name="other"><u>Other</u></a>
* Constants - All uppercase and underscore between words.
* Export variable - All uppercase and underscore between words.
* Directory - Spacing between names, uppercase for each word.

***

Function Description
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