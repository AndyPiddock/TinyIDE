# TinyIDE

## March 2021, only the single stack version is now available 

V1.4.1 Added width resize buttons with left mouse down, object info is now always shown, object info now acts as a drag stack with left mouse down.

![TinyIDE](https://2108.co.uk/TinyIDE/TinyIDE-Win3.PNG)

More details, user instructions https://2108.co.uk/tinyide/

TinyIDE a Free alternative minimalist IDE Plugin for LiveCode.

TinyIDE gives you more space to develop your ideas

Cross platform, Windows, Mac, Linux. For LC V8 onwards.

TinyIDE is an effort to provide an alternative LiveCode IDE which uses a minimum amount of screen space without compromising on usability or efficiency.

I started this project as a result of frustration caused by constantly having to open/close the LC Tools palette and having to move other LC palettes/windows so that I could work comfortably on my laptop.

Apart from keeping the TinyIDE footprint as small as possible it was essential that the TinyIDE plugin was non-destructive to the standard LC IDE.

No standard LC IDE files are changed when using TinyIDE.

Menu items, Classic Controls, Widgets and Graphics items are copied at the launch of the TinyIDE plugin, so it should keep up to date as new widgets or LC Menu items are added to the standard LC IDE.

The primary reason I am able to keep the TinyIDE footprint small is that the Tools palette is now contained in a horizontal scroller within the TinyIDE.

16-08-2019 - Allan, axsoft has made the following useful additions, thank you.

Added script coloring to code peek window
when hovering over an object added key down detection
Cmd/Ctrl key down shows the text property of the object
Option/Alt key down show the custom properties of the object
Cmd/Ctrl and Shift keys down shows the Card script
Option/Alt and Shift keys down shows the Stack Script 
See script button_BtnFSHoverInfo_13660 modified below

Added two buttons 'Code' and 'Inspector' to the toolbar to quickly bring up card and stack code and properties
Code button
View stack & card scripts. With Cmd/Ctrl opens card script, with Option/Alt opens stack script
Inspector button
Open stack & card inspectors. With Cmd/Ctrl opens card inspector, with Option/Alt opens stack inspector


__Installation__

Download https://github.com/AndyPiddock/TinyIDE/archive/master.zip and extract to your working plugins directory and launch from the Development/Plugins menu of the standard LC IDE … done.
Tip> use the Plugins Settings to start TinyIDE when LiveCode starts up.
