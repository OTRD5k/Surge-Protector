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

Class.new = function(toolbar, text, tooltip, image)
	local self = setmetatable({}, Class)

	if image ~= nil and image ~= "" then
		self.Button = script:FindFirstChild("ImageButton"):Clone()
		self.Button.Image = image
	else
		self.Button = script:FindFirstChild("TextButton"):Clone()
		self.Button.Text = text
	end
	
	self.Button.Parent = toolbar.Toolbar
	
	self.Click = self.Button.MouseButton1Click
	return self
end

Class.SetActive = function(self, active)
	return
end

return Class