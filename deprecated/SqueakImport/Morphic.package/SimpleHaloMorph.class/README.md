This is a simple base class for halos in the system. It represents the minimal interface used to implement custom halo morphs. 

It provides:

- event handling code to invoke and transfer a halo when clicking the meta-button (blue)
- move the halo's target (morph) when click-hold-drag the meta-button
- one close button as a minimal handle (see #addHandles)

In general, the halo concept consists of one dedicated user interaction (meta-button click) to invoke an additional, interactive view (the halo) for any morph. This interactive view is itself a morph that can have submorphs (e.g. buttons or text fields) to enrich the target morph. Besides button-based interactions (e.g. resize, move, duplicate, etc.), this could also be used to show other, even domain-specific, information.

Use the halo concept to provide means to explore and modify interactive, graphical elements in Squeak and your application. You can benefit from this concept without wasting additional screen space. In non-Squeak applications, the meta-key (typically the mouse-wheel button) is often without real functionality for the user. There, it makes scrolling more convenient---at best. In Squeak, you can easily take advantage of this button click. 

Notice that direct user input is very limited. Many keyboard shortcuts (such as [ctrl]+[c]) are already pre-defined and should not be remapped for your domain-specific applications to avoid user confusion. Key chords (such as [ctrl]+[alt]+[v], [a] from Visual Studio) have to be learned with great effort. 

The left mouse click (red) selects something.
The right mouse click (yellow) invokes a context menu.
Only the middle click, the meta-key, the blue button, is unused in many environments.

This is where the halo concept comes in.

[For two- or single-button mice, the meta-key can be simulated.]