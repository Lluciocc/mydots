# mydots - @Lluciocc

## Screenshots
![screenshot1](https://github.com/Lluciocc/mydots/blob/master/screenshot/1.png)
![screenshot2](https://github.com/Lluciocc/mydots/blob/master/screenshot/2.png)
![screenshot3](https://github.com/Lluciocc/mydots/blob/master/screenshot/3.png)
![screenshot4](https://github.com/Lluciocc/mydots/blob/master/screenshot/4.png)

## Wallpapers
If you want to get my wallpapers:  

`cd ~/Pictures && git clone https://github.com/mylinuxforwork/wallpaper.git`

## Wallpapers with wofi
To make the script in `hypr/wallpaper.sh` works great, you can edit the bind in `hypr/hyprland.conf`:     
`bind = $mainMod, J, exec, ~/.local/bin/wallpaper-picker.sh`    

## Music with waybar
You must use spotify, look at the script at `waybar/music.sh` for code     

## Additional Custom scripts
All custom script are located in `script/`

### DIMG
Simple script to download image an place it to the right folder    
Made to work with my wofi wallpaper manager :)    
**Usage**: `dimg <url> [filename]`   
**Example**: `dimg https://4kwallpapers.com/images/wallpapers/blue-abstract-3840x2160-24798.png wallpaper.png`

### Start
Simple script that start a process in background        
**Usage**: `start <command> [args...]`                
**Example**: `start waybar`           
