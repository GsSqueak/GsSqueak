menu commands
explainFlapsText
	"Answer the text, in English, to show in a help-window about Flaps."
	^ 'Flaps are like drawers on the edge of the screen, which can be opened so that you can use what is inside them, and closed when you do not need them.  They have many possible uses, a few of which are illustrated by the default set of flaps you can get as described below.

''Shared flaps'' are available in every morphic project.  As you move from project to project, you will see these same shared flaps in each, though there are also options, on a project-by-project basis, to choose which of the shared flaps should be shown, and also momentarily to suppress the showing of all shared flaps.   

To get started using flaps, bring up the desktop menu and choose ''flaps...'', and make the menu stay up by choosing ''keep this menu up''.  If you see, in this flaps menu,  a list of flap names such as ''Squeak'', ''Tools'', etc., it means that shared flaps are already set up in your image.  If you do not see the list, you will instead see a menu item that invites you to ''install default shared flaps''; choose that, and new flaps will be created, and the flaps menu will change to reflect their presence.

''Project flaps'' are flaps that belong to a single morphic project.  You will see them when you are in that project, but not when you are in any other morphic project.

If a flap is set up as a parts bin (such as the default Tools and Supplies flaps), you can use it to create new objects -- just open the flap, then find the object you want, and drag it out; when the cursor leaves the flap, the flap itself will snap closed, and you''ll be left holding the new object -- just click to place it exactly where you want it.

If a flap is *not* set up as a parts bin (such as the default ''Squeak'' flap at the left edge of the screen) you can park objects there (this is an easy way to move objects from project to project) and you can place your own private controls there, etc.  Everything in the default ''Squeak'' flap (and all the other default flaps, for that matter) is there only for illustrative purposes -- every user will want to fine-tune the flaps to suit his/her own style and needs.

Each flap may be set up to appear on mouseover, dragover, both, or neither.  See the menu items described below for more about these and other options.

You can open a closed flap by clicking on its tab, or by dragging the tab toward the center of the screen

You can close an open flap by clicking on its tab or by dragging the tab back off the edge of the screen.

Drag the tab of a flap to reposition the tab and to resize the flap itself.  Repositioning starts when you drag the cursor out of the original tab area.

If flaps or their tabs seem wrongly positioned or lost, try issuing a restoreDisplay from the screen menu.

The red-halo menu on a flap allows you to change the flap''s properties.   For greatest ease of use, request ''keep this menu up'' here -- that way, you can easily explore all the options in the menu.

tab color...				Lets you change the color of the flap''s tab.
flap color...				Lets you change the color of the flap itself.

use textual tab...		If the tab is not textual, makes it become textual.
change tab wording...	If the tab is already textual, allows you to edit
							its wording.

use graphical tab...		If the tab is not graphical, makes it become
							graphical.
choose tab graphic...	If the tab is already graphical, allows you
							to change the picture.

use solid tab...			If the tab is not solid, makes it become solid, i.e.
							appear as a solid band of color along the
							entire length or width of the screen.

parts-bin behavior		If set, then dragging an object from the flap
							tears off a new copy of the object.

dragover				If set, the flap opens on dragover and closes
							again on drag-leave.

mouseover				If set, the flap opens on mouseover and closes
							again on mouse-leave. 

cling to edge...			Governs which edge (left, right, top, bottom)
							the flap adheres to.

shared					If set, the same flap will be available in all projects; if not, the
							flap will will occur only in one project.

destroy this flap		Deletes the flap.

To define a new flap, use ''make a new flap'', found in the ''flaps'' menu.

To reinstate the default system flaps, you can use ''destroy all shared flaps'' from the ''flaps'' menu, and once they are destroyed, choose ''install default shared flaps''.

To add, delete, or edit things on a given flap, it is often wise first to suspend the flap''s mouse-over and drag-over sensitivity, so it won''t keep disappearing on you while you''re trying to work with it.

Besides the three standard flaps delivered with the default system, there are two other flaps readily available on demand from the ''flaps'' menu -- one is called ''Stack Tools'', which provides some tools useful for building stack-like content, the other is called ''Painting'', which provides a quick way to make a new painting.  Simply clicking on the appropriate checkbox in the ''flaps'' menu will toggle the corresponding flap between being visible and not being visible in the project.'