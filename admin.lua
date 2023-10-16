local workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Hint = Instance.new("Hint",workspace)

function NotifyUser(title,name,dur)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = title,Text = name,Duration = dur})
end

-- wait!
function Hat(name)
if name == "fedora" then
    workspace.Hats:FireServer("Black Fedora",0)
elseif name == "dominus" then
    workspace.Hats:FireServer("Dominus Empyreus'",0)
  else
    NotifyUser("ERROR","Available hats: dominus and fedora",20)
end
end

function FindUser(name)
for i,v in pairs(game.Players:GetChildren()) do
   if (string.sub(string.lower(v.DisplayName),1,string.len(name))) == string.lower(name) then
      return v.Name
   end
  end
end

function GetRapper(name) --player1 / player2
    return workspace.RapBattles.Rappers[name].Value
end

function voting(name)
        if name == "p1" then
            workspace.Votes:FireServer(false,"p1")
        elseif name == "p2" then
            workspace.Votes:FireServer(false,"p2")
        else
            NotifyUser("Invalid Player","Please select p1 or p2",20)
        end
end
    
local prefix = "/"
local LPlayer = game.Players.LocalPlayer
LPlayer.Chatted:Connect(function(msg)
msg = msg:lower()
if string.sub(msg,1,3) == "/e " then
msg = string.sub(msg,4)
end
if string.sub(msg,1,1) == prefix then
local cmd
local space = string.find(msg," ")
if space then
cmd = string.sub(msg,2,space-1)
else
cmd = string.sub(msg,2)
end

if cmd == "hat" then
local var = string.sub(msg,space+1)
Hat(var)
elseif cmd == "autovote" then
local var = string.sub(msg,space+1)
if loopVoting then
        loopVoting:Disconnect()
end
                    
loopVoting = RunService.RenderStepped:Connect(function()
        voting(var)
end)
elseif cmd == "stopvote" then
if loopVoting then
        loopVoting:Disconnect()
end
else
      NotifyUser("Invalid Command","Available commands: /hat [hat name] /autovote [p1 or p2] /stopvote",20)
end
--limit
end
end)

RunService.RenderStepped:Connect(function()
Hint.Text = string.format("p1: %s | p2: %s",GetRapper("player1"),GetRapper("player2"))
end)
