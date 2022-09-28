# CE_ModUpdater
A little tool for Conan Exiles that uses SteamCMD to update your mods.

It's meant for client only, don't try to use it on the server!

Download [here](https://github.com/Tiress/CE_ModUpdater/releases/tag/v0.1.0)

# How it works
It downloads a SteamCMD client and runs it with the mods from your modlist.txt as parameters.

SteamCMD will download more files in the process (about 200MB), because it's basically a normal Steam client but without the GUI. This will happen only once, but whenever Steam updates, SteamCMD will update it's files too. So you won't have to download 200MB every time, but sometimes it might need to download a few MB to update itself.

Once that is done, SteamCMD will go through all mods from your modlist.txt to validate it's files and update them if necessary.

# Known bugs
It happened to me a few times that SteamCMD got stuck at the update process of mods. It looks something like this:

![image](https://user-images.githubusercontent.com/30245872/192832876-18669d1f-b890-4ca0-8b38-d337f6ea1751.png)

If it happens to you and the update gets stuck like that for more than 30 seconds, just close the program and start it again.

# To-Do
- figure out why SteamCMD gets stuck sometimes
- add more error checks
- turn it into a compiled app?
- pull the path automatically so that the user doesn't have to fill the config file
