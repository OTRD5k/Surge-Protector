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

local Class = {}
Class.__index = Class

setmetatable(Class, {
	__call = function (cls, ...)
		return cls.new(...)
	end,
})

Class.new = function(name)
	local self = setmetatable({}, Class)
	self.Buttons = {}
	self.Toolbar = script:FindFirstChild("Toolbar"):Clone()
	self.Toolbar.ToolBarName.Text = name
	self.Scrolling = _G.ToolbarFrame
	self.Toolbar.Parent = self.Scrolling
	_G.PseudoToolbars[#_G.PseudoToolbars+1] = self
	return self
end

Class.RenderAll = function(self)
	local toolbars = _G.PseudoToolbars
	for i=1, #toolbars do
		toolbars[i]:Render()
		if i==1 then
			toolbars[i].Toolbar.Position = UDim2.new(0,0,0,0)
		else
			toolbars[i].Toolbar.Position = UDim2.new(
				0,
				toolbars[i-1].Toolbar.Position.X.Offset + toolbars[i-1].Toolbar.Size.X.Offset + 10,
				0,
				0			
			)
		end
	end
	local canvassize = toolbars[#toolbars].Toolbar.Position.X.Offset + toolbars[#toolbars].Toolbar.Size.X.Offset
	self.Scrolling.CanvasSize = UDim2.new(0,canvassize,0,0)
end

Class.Render = function(self)
	for i=1, #self.Buttons do
		local button = self.Buttons[i].Button
		button.Parent = self.Toolbar
		button.Position = UDim2.new(0, (i-1)*40, 0, 0)
	end
	self.Toolbar.Size = UDim2.new(0, #self.Buttons*40, 0.75, 0)
end

Class.CreateButton = function(self, text, tooltip, image)
	local newbutton = self.Classes["Button"](self, text, tooltip, image)
	self.Buttons[#self.Buttons + 1] = newbutton
	self:RenderAll()
	return newbutton
end

return Class