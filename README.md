# mips_platformer
 
General Notes
-------------
***

Project Structure
-----------------

***

Naming Structure
----------------

### <u>Camel Case</u>
* 


### <u>Snake Case</u>
* Script's name
* Scene's name
* Resource's name
* function
* signal


### <u>Other</u>
* Constants - All uppercase and underscore between words.
* Export variable - All uppercase and underscore between words.
* Directory - Spacing between names, uppercase for each word.

***

Function Description
--------------------
Wirting the description before the function definition in the following format([Closure Compiler](https://github.com/google/closure-compiler/wiki/Annotating-JavaScript-for-the-Closure-Compiler) by Google):<br/>
/**<br/>
\* Function Description<br/>
\* @param {type} member - Param Description<br/>
\* @param {type} id - Param Description<br/>
\* .<br/>
\* .<br/>
\* .<br/>
\* @returns {type} - Return Description<br/>
\*/<br/>
<br/>

#### for example:
/**<br/>
\* Return true or false for, if the member is allowed to use the command. Used for commands which are called through DM<br/>
\* @param {GuildMember} member - The guild member which want to use the command<br/>
\* @param {string} id - id of the command<br/>
\* @returns {boolean} - Is the member is allowed to use the command<br/>
\*/<br/>
<br/>

***

***