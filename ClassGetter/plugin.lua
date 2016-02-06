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

Class.new = function(realplug)
	local self = setmetatable({}, Class)
	
	self.RealPlugin = realplug
	
	self.Deactivation = self.RealPlugin.Deactivation
	
	setmetatable(self, {
		__index = function(_, k)
            if Class[k] ~= nil then
                return Class[k]
            elseif rawget(self, k) ~= nil then
				return self[k]				
			else
				local psuedofunc = function(...)
					local realfunc = self.RealPlugin[k]
					local arg = {...}
					arg[1] = self.RealPlugin
					return realfunc(unpack(arg))
				end
                return psuedofunc
            end
        end
	})
	
	return self
end

Class.CreateToolbar = function(self, name)
	return self.Classes["ToolBar"].new(name)
end



return Class