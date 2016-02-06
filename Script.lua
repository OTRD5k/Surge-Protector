--[[
                                           
   ..'.,:cclcl;;cc:,.  Plugin By           
  'llllcllcllllllllc:. OTRainbowDash5000   
  ;l;...:ld0Oollcclll.                     
 .,;   ;kk0KKkccllllc.                     
 .;; .::kk0kollllllll:.                    
     :dkNk0olllllllllc'                    
   .x00K0xoccllclllll:.      .....         
    ,000olllcclllc:;.     .':cllllc'       
     .;:llllclllll,     ':ccllllcllc.....  
      ..:llcllll:......:ccc:cllllclccllll' 
      .:lodooxoddk0K0occ.. .clllcclllllll; 
       oKKKKKKKKK0XKKkkO, .cllllcllcclllc. 
       'OKKKKKK000K0K0O0: .lllllllllccl;.  
        ,KK000K0KKKKKO0x.  .;:ccclllccll,  
        ;KKK00o,dKKK0OOo.    ;lllclcllll;  
        lKKK00x  lKKK0O0o    ,llllcllcc,   
       .OKKK00k. .OKKK00O,   .,cccllllc.   
       lKKKK00O.  xKKK0O0o      ...;cc;.   
      ,0KKKK00k. '0KKKKO0k.                
      lO0K0Oc:. .x0000k:;' Plugin By       
        ...       ....   OTRainbowDash5000        
                        
--]]



_G.PseudoToolbars = {}

_G.ToolbarFrame = script:FindFirstChild("ScrollingFrame")
_G.ToolbarFrame.Parent = Instance.new("ScreenGui")
_G.ToolbarFrame.Parent.Parent = game.CoreGui

local scrollingframe = _G.ToolbarFrame
local movebutton = script:FindFirstChild("MoveButton")
movebutton.Parent = scrollingframe.Parent

local expanded = true

movebutton.MouseButton1Click:connect(function()
	if expanded == true then
		expanded = false
		movebutton.Position = UDim2.new(1,-20,0,0)
		movebutton.Image = "rbxassetid://359100099"
		scrollingframe:TweenPosition(UDim2.new(0,0,0,-75), "Out", "Quad", 1, true)
	else
		expanded = true
		movebutton.Position = UDim2.new(1,-20,0,75)
		movebutton.Image = "rbxassetid://359100130"
		scrollingframe:TweenPosition(UDim2.new(0,0,0,0), "Out", "Quad", 1, true)
	end
end)


_G.PseudoPluginClasses = require(script.Parent.ClassGetter)


while _G.PseudoPluginClasses == nil do
	wait()
end

local enviro = getfenv()

do
	local plugin = enviro["PluginManager"]():CreatePlugin()
	local fakeplugin = _G.PseudoPluginClasses["plugin"].new(plugin)
	enviro["plugin"] = fakeplugin
	
	enviro["PluginManager"] = setmetatable({}, {
		__call = function(t, ...)
			local returnt = {}
			returnt["CreatePlugin"] = function()
				return fakeplugin
			end
			return returnt
		end
	})
	
end

local toolbar = plugin:CreateToolbar("Surge Protector")

local environmentchanger = [[
while _G.PseudoPluginClasses == nil do
	wait()
end

local enviro = getfenv()

do
	local plugin = enviro["PluginManager"]():CreatePlugin()
	local fakeplugin = _G.PseudoPluginClasses["plugin"].new(plugin)
	enviro["plugin"] = fakeplugin
	
	enviro["PluginManager"] = setmetatable({}, {
		__call = function(t, ...)
			local returnt = {}
			returnt["CreatePlugin"] = function()
				return fakeplugin
			end
			return returnt
		end
	})
	
end

]]

local button = toolbar:CreateButton(
	"Surge Protect",
	"Converts a Plugin To a Surge Protected Plugin",
	"http://www.roblox.com/asset/?id=359061374"
)

function recursesurge(inst)
	if inst.ClassName == "Script" then
		if string.find(inst.Source, "while _G.PseudoPluginClasses == nil do") == nil then
			inst.Source = environmentchanger .. inst.Source
		end
	end
	local children = inst:GetChildren()
	for i=1, #children do
		recursesurge(children[i])
	end
end

button.Click:connect(function()
	local selection = game.Selection:Get()
	for k=1, #selection do
		recursesurge(selection[k])
	end
	print("Selected plugins converted to surge protector plugins")
end)