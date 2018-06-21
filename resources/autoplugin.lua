------Autoinstall plugin
-------------------Resource-----------
dofile("git/shared.lua")
if __UPDATE == 1 then
	local wstrength = wlan.strength()
	if wstrength then
		if wstrength > 55 then dofile("git/updater.lua") end
	end
end

color.loadpalette() -- Load Defaults colors
back = image.load("resources/back.png")

while true do
	buttons.read()
	if back then back:blit(0,0) end
	
	screen.print(10,20,"Autoplugin Light  Install the plugins with a click",1,color.red)
       screen.print(10,50,"List of plugins ready to install:",1,color.white)
	screen.print(25,80,"-> NoNpDrm by TheFl0w\n-> Shellbat by nowrep\n-> NoAVLS by SilicaAndPina",1,color.green)
	
	screen.print(25,380,"Press CROSS to install Plugins on ux0:tai",1,color.white,color.blue)
       screen.print(25,400,"Press CIRCLE to install Plugins on ur0:tai",1,color.white,color.black)
	screen.print(15,420,"Press START to exit.",1,color.white,color.red)

	screen.flip() -- Show Buff

	if buttons.cross then
              if files.exists("ux0:tai") then files.rename("ux0:tai", "_backup") end
     		files.extract("resources/autoplugin.zip","ux0:/tai")
              files.extract("resources/config.zip","ux0:/tai")
		os.message("Your PSVita will restart...\nThe plugins have been installed\n\nThe old folder tai has been saved on ux0: as tai_backup",0)
		os.delay(2500)
	buttons.homepopup(1)
	power.restart()
end

	if buttons.circle then
           if files.exists("ur0:tai/config.txt") then files.rename("ur0:tai/config.txt", "config_backup.txt") end
		files.copy("ur0:tai","ur0:tai/backup/")
              files.extract("resources/autoplugin.zip","ur0:/tai")
              files.extract("resources/config2.zip","ur0:/tai")
		os.message("Your PSVita will restart...\nThe plugins have been installed\n\nThe old file has been saved on ur0:tai/config_backup.txt",0)
		os.delay(2500)
	buttons.homepopup(1)
	power.restart()
end

	if buttons.released.start then break end -- Exit
end