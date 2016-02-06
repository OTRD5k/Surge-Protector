local ClassGetter = {}

function getclasses(ctable)
	for i=1, #ctable do
		if ctable[i]:IsA("ModuleScript") then
			ClassGetter[ctable[i].Name] = require(ctable[i])
			ClassGetter[ctable[i].Name]["Classes"] = ClassGetter
			ClassGetter[ctable[i].Name]["Type"] = ctable[i].Name
		end
		getclasses(ctable[i]:GetChildren())
	end
end

children = script:GetChildren()
getclasses(children)

--for key,value in pairs(t) do print(key,value) end




return ClassGetter
