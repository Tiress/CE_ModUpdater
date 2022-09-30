# CE_ModUpdater
A little tool for Conan Exiles that uses SteamCMD to update your mods.

It's meant for client only, don't try to use it on the server!

Download [here](https://github.com/Tiress/CE_ModUpdater/releases/tag/v0.1.0)

# Instructions
1. Extract the files where you like, it shouldn't really matter
2. Edit config.txt and fill the required paths (ConanPath and WorkshopPath)

![cfg](https://user-images.githubusercontent.com/30245872/193231258-d4d95c52-dccb-417e-87e5-57598d601f8f.JPG)

3. Run ModUpdater. This is what you should see it do:

It downloads SteamCMD first..

![mu_prep](https://user-images.githubusercontent.com/30245872/193234036-6124df4e-6b32-4c85-ba64-eab819f2abfd.jpg)

![mu_down](https://user-images.githubusercontent.com/30245872/193234669-a2fc9e74-90f2-41d3-9f2a-2930303355ae.jpg)

..then runs SteamCMD to update it and then update your mods..

![mu_main](https://user-images.githubusercontent.com/30245872/193234725-623f9be2-f787-491e-ad6d-5a3f16df0645.jpg)

..and this is how it should look when it finishes.

![mu_finish](https://user-images.githubusercontent.com/30245872/193232466-e7c1dcb1-f406-45b1-8fcd-1a46c4bc2ebb.jpg)

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

