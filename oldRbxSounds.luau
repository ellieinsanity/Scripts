-- This is meant to replicate the sound velocity running.
local players = game:GetService("Players")

local function monitorCharacter(char, m)
  local hrp = char:FindFirstChild("HumanoidRootPart")
  if (not hrp and m) then
    hrp = char:WaitForChild("HumanoidRootPart")
  end  
  local sRunning = hrp:WaitForChild("Running")
  local sClimbing = hrp:WaitForChild("Climbing")
  local humanoid = char:WaitForChild("Humanoid")
  humanoid.Running:connect(function(speed)
    if speed>0.5 then
      sRunning:Resume()
      sRunning.Pitch = speed / 8.0
    else
      sRunning:Pause()
    end
  end)
  humanoid.Climbing:connect(function(speed)
    if speed>0.01 then
      sClimbing:Resume()
      sClimbing.Pitch = speed / 5.5
    else
      sClimbing:Pause()
    end
  end)
end

local function monitorPlayer(player)
  if (player.Character and player.Character:FindFirstChild('HumanoidRootPart')) then
    monitorCharacter(player.Character)
  end
  player.CharacterAdded:connect(function(character)
    monitorCharacter(player.Character, true)
  end)
end

for _,player in next, players:GetPlayers() do
  monitorPlayer(player)
end
players.PlayerAdded:connect(monitorPlayer)
