local core = {}
--------------------------------------------------------------------
-- The Core of the script, holds the functions used for later use. -
--------------------------------------------------------------------

function core:Load(saved)
	local malevolence = Instance.new('Model', workspace)
	malevolence.Name = 'loadedModel ' .. tostring(math.random())

	for int, array in pairs(saved) do
		local part = Instance.new('Part', malevolence)

		for index, value in next, {'BrickColor', 'Anchored', 'CanCollide', 'Shape', 'FormFactor', 'Size', 'CFrame', 'BackSurface', 'BottomSurface', 'FrontSurface', 'LeftSurface', 'RightSurface', 'TopSurface'} do
			part[value] = array[value]
		end
	end
end

------------------------------
-- Loads the selected build. -
------------------------------

function core:Save(searched)
	local savedParts = {}

	for int, part in pairs(searched) do
		savedParts[int] = {}
		for index, value in next, {'BrickColor', 'Anchored', 'CanCollide', 'Shape', 'FormFactor', 'Size', 'CFrame', 'BackSurface', 'BottomSurface', 'FrontSurface', 'LeftSurface', 'RightSurface', 'TopSurface'} do
			savedParts[int][value] = part[value]
		end
	end

	core:Load(savedParts)
end

------------------------------
-- Saves the selected build. -
------------------------------

function core:Search(object)
	local selection = object and object:GetChildren() or game.Selection:Get()
	local selected = {}

	for index, object in pairs(selection) do
		if object:IsA('Part') then
			table.insert(selected, object)
		elseif object:IsA('Model') then
			core:Search(object)
		end	
	end

	if #selected > 0 then
		core:Save(selected)
	end
end

--------------------------------------------------------------------
-- Searches the selected build, selects the things we want to save -
-- And sends them off to be saved by the core:Save() function. -----
--------------------------------------------------------------------

core:Search()

--------------------------------------------------------------------
------------ Core ---- SaxaphoneWalrus ---- Malevolence ------------
--------------------------------------------------------------------
--------------------------------------------------------------------
------------------- VERSION ---- 0.0.2 ---- NOTE -------------------
--------------------------------------------------------------------
-- Currently only runnable through the Command Bar or some other ---
-- service that allows for a high enough security level (plugins?) -
-- I will release another version for regular script capabilities. -
-- Which will most likely run off of multiple Region3 searches... --
--------------------------------------------------------------------
