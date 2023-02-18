if fs.exists("APM") then
else
  term.setTextColor(colors.yellow)
  print("Error: Unable to open APM_Shop because APM is missing")
  print("Info: Installing APM")
  term.setTextColor(colors.gray)
  shell.run("wget https://raw.githubusercontent.com/TheAio/CC-APM/main/APM APM")
  term.setTextColor(colors.yellow)
  if fs.exists(APM) then
    print("Sucsess: APM has been installed, continuing in 3 seconds")
    sleep(3)
  else
    print("Critical: APM could not be installed, it is critical for APM_Shop to run")
    return false
  end
end
function clear()
  for i=1,90 do
    print("                                                                                                                                                ")
  end
end
function DrawBg()
  if term.isColor() then
    term.setBackgroundColor(colors.cyan)
    clear()
    term.setTextColor(colors.white)
  else
    term.setBackgroundColor(colors.black)
    clear()
    term.setTextColor(colors.white)
  end
  term.setCursorPos(1,1)
end
function MainMenu()
  while true do
    DrawBg()
    print("APM_Store")
    print("1. Packages")
    print("2. Programs")
    print("3. About")
    print("4. Install a file")
    print("5. Update")
    print("6. Find a id mirror")
    print("7. Quit")
    sel = read()
    if sel == "1" then
      while true do
        DrawBg()
        print("APM_Store | Packages")
        print("1. NoStartupNoPackman")
        print("2. Back")
        sel = read()
        if sel == "1" then
          shell.run("wget https://raw.githubusercontent.com/TheAio/CC-APM/main/Installers/NoStartupNoPackman.APMs")
          shell.run("APMs NoStartupNoPackman.APMs")
        elseif sel == "2" then
          break
        end
      end
      break
    elseif sel == "2" then
      local len = assert(loadfile("APM"))("API","getLen")
      local count = 0
      local pageCount = 0
      while true do
        pageCount = pageCount + 1
        count = count + 1
        pageCount = pageCount + 1
        if count > len then
          print("END OF THE LIST")
          print("Returning in 3 seconds")
          sleep(3)
          break
        end
        print(count,assert(loadfile("APM"))("API","getName",count))
        if pageCount == 11 then
          print("Press enter to continue or enter 'stop' to stop listing items")
          if string.upper(read()) == "STOP" then
            break
          end
          pageCount = 0
          DrawBg()
        end
      end
      break
    elseif sel == "3" then
      DrawBg()
      print("APM_Shop")
      print("APM_Shop is a GUI built ontop of APM, it uses APMs to install lists of files")
      print("For more information please visit the github page on")
      print("https://github.com/TheAio/CC-APM")
      break
    elseif sel == "4" then
      DrawBg()
      while true do
        print("1. search by name")
        print("2. search by id")
        print("3. back")
        sel = read()
        if sel == "1" then
          print("Please enter the name of your package")
          shell.run("APM findInstall",read())
          break
        elseif sel == "2" then
          print("Please enter the id of your package")
          shell.run("APM install",tonumber(read()))
          break
        elseif sel == "3" then
          break
        end
      end
    elseif sel == "6" then
      DrawBg()
      print("Please enter the package id")
      shell.run("APM mirror",tonumber(read()))
      sleep(3)
    elseif sel == "7" then
      return true
    elseif sel == "5" then
      shell.run("APM update")
      break
    end
  end
end
MainMenu()
