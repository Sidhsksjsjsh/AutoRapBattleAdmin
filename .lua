local workspace = game:GetService("Workspace")
-- wait!
function Hat(name)
if name == "fedora" then
    workspace.Hats:FireServer("Black Fedora",0)
elseif name == "dominus" then
    workspace.Hats:FireServer("Dominus Empyreus'",0)
  else
    print("not found")
end

function FindUser(name)
for i,v in pairs(game.Players:GetChildren()) do
   if (string.sub(string.lower(v.DisplayName),1,string.len(name))) == string.lower(name) then
      return v.Name
   end
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
print(var)
elseif cmd == "autovote" then
game.Players.LocalPlayer.Character:BreakJoints()

else
      print("command not found")
end
--limit
end
end)
