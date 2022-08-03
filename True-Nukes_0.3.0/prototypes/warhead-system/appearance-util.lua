local function generateAppearance(thing)
  local icons = nil
  local pictures = nil
  local lights = nil
  if(thing.appearance) then
    icons = thing.appearance.icons
    pictures = thing.appearance.pictures
  else
    if(thing.icons) then
      icons = thing.icons
    elseif(thing.icon) then
      icons = {thing.icon}
    end
    if(thing.pictures) then
      pictures = thing.pictures
    elseif(thing.picture) then
      pictures = {thing.picture}
    end
    if(thing.lights) then
      lights = thing.lights
    elseif(thing.lights) then
      lights = {thing.light}
    end
  end
  local iconsFinal = {}
  local picturesFinal = {}
  if (icons) then
    for _,i in pairs(icons) do
      if(type(i) == "table") then
        if(i.size) then
          local tmp = table.deepcopy(i)
          tmp.icon_size = tmp.size
          table.insert(iconsFinal, tmp)
        else
          table.insert(iconsFinal, i)
        end
      else
        table.insert(iconsFinal, {icon = i, icon_size = 64})
      end
    end
    if(not pictures) then
      pictures = {}
      for _,i in pairs(iconsFinal) do
        local shift = {0, 0}
        if(i.shift) then
          shift = {i.shift[1]*0.01875, i.shift[2]*0.01875}
        end
        table.insert(pictures, {filename = i.icon, size = i.icon_size or 64, scale = (i.scale or 1)/4.0, shift = shift})
      end
      for _,l in pairs(lights) do
        local lightSetup = {}
        if(type(l) == "table") then
          if(l.icon) then
            local shift = {0, 0}
            if(l.shift) then
              shift = {l.shift[1]*0.01875, l.shift[2]*0.01875}
            end
            lightSetup = {filename = l.icon, size = l.icon_size or l.size or 64, scale = (l.scale or 1)/4.0, shift = shift}
          else
            lightSetup = l
          end
        else
          lightSetup = {filename = l, size = 64, scale = 0.25}
        end
        table.insert(pictures, lightSetup)
      end
    end
  end
  if (pictures) then
    for _,p in pairs(pictures) do
      if(type(p) == "table") then
        if(p.icon) then
          local shift = {0, 0}
          if(p.shift) then
            shift = {p.shift[1]*0.01875, l.shift[2]*0.01875}
          end
          table.insert(picturesFinal, {filename = p.icon, size = p.icon_size or p.size or 64, scale = (p.scale or 1)/4.0, shift = shift})
        else
          table.insert(picturesFinal, p)
        end
      else
        table.insert(picturesFinal, {filename = p, size = 64, scale = 0.25})
      end
    end
  end
  return {icons = iconsFinal, pictures = picturesFinal}
end


return generateAppearance