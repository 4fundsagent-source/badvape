local cloneref = cloneref or function(obj) return obj end
local game = cloneref(game)

local isfile = isfile or function(file)
	local suc, res = pcall(function()
		return readfile(file)
	end)
	return suc and res ~= nil and res ~= ''
end

-- config
local config = {
	username = 'hijacked',
	role = 'hijacked',
	closet = false,
	developer = true,
}

local folder = 'badvape'

-- set auth globals
getgenv().username = config.username
getgenv().password = 'cracked'
getgenv().catrole = config.role
getgenv().closet = config.closet
getgenv().catvapedev = config.developer
getgenv().used_init = true
getgenv().canDebug = true
getgenv().makestage = function() end

shared.VapeDeveloper = config.developer
shared.vapereload = false

-- folder setup
local folders = {
	folder,
	folder .. '/profiles',
	folder .. '/assets',
	folder .. '/assets/new',
	folder .. '/guis',
	folder .. '/libraries',
	folder .. '/games',
	folder .. '/scripts',
	folder .. '/cache',
}

for _, f in ipairs(folders) do
	if not isfolder(f) then
		makefolder(f)
	end
end

writefile(folder .. '/profiles/commit.txt', '0000000')
writefile(folder .. '/profiles/gui.txt', 'new')

-- hook file functions to redirect catrewrite -> badrewrite
local function redirectPath(path: string): string
	if type(path) == 'string' then
		if path:find('catrewrite', 1, true) then
			return path:gsub('catrewrite', folder)
		end
		if path:find('badrewrite', 1, true) then
			return path:gsub('badrewrite', folder)
		end
	end
	return path
end

local oldReadfile = readfile
getgenv().readfile = newcclosure(function(path)
	return oldReadfile(redirectPath(path))
end)

local oldWritefile = writefile
getgenv().writefile = newcclosure(function(path, content)
	return oldWritefile(redirectPath(path), content)
end)

local oldIsfile = isfile
getgenv().isfile = newcclosure(function(path)
	return oldIsfile(redirectPath(path))
end)

local oldIsfolder = isfolder
getgenv().isfolder = newcclosure(function(path)
	return oldIsfolder(redirectPath(path))
end)

local oldMakefolder = makefolder
getgenv().makefolder = newcclosure(function(path)
	return oldMakefolder(redirectPath(path))
end)

local oldListfiles = listfiles
if oldListfiles then
	getgenv().listfiles = newcclosure(function(path)
		return oldListfiles(redirectPath(path))
	end)
end

-- asset id mappings (from ui.lua) - maps filename to rbxassetid
local assetIdMap = {
	['add.png'] = 'rbxassetid://14368300605',
	['alert.png'] = 'rbxassetid://14368301329',
	['allowedicon.png'] = 'rbxassetid://14368302000',
	['allowedtab.png'] = 'rbxassetid://14368302875',
	['arrowmodule.png'] = 'rbxassetid://14473354880',
	['back.png'] = 'rbxassetid://14368303894',
	['bind.png'] = 'rbxassetid://14368304734',
	['bindbkg.png'] = 'rbxassetid://14368305655',
	['blatanticon.png'] = 'rbxassetid://14368306745',
	['blockedicon.png'] = 'rbxassetid://14385669108',
	['blockedtab.png'] = 'rbxassetid://14385672881',
	['blur.png'] = 'rbxassetid://14898786664',
	['blurnotif.png'] = 'rbxassetid://16738720137',
	['close.png'] = 'rbxassetid://14368309446',
	['closemini.png'] = 'rbxassetid://14368310467',
	['colorpreview.png'] = 'rbxassetid://14368311578',
	['combaticon.png'] = 'rbxassetid://14368312652',
	['customsettings.png'] = 'rbxassetid://14403726449',
	['dots.png'] = 'rbxassetid://14368314459',
	['edit.png'] = 'rbxassetid://14368315443',
	['expandicon.png'] = 'rbxassetid://14368353032',
	['expandright.png'] = 'rbxassetid://14368316544',
	['expandup.png'] = 'rbxassetid://14368317595',
	['friendstab.png'] = 'rbxassetid://14397462778',
	['guisettings.png'] = 'rbxassetid://14368318994',
	['guislider.png'] = 'rbxassetid://14368320020',
	['guisliderrain.png'] = 'rbxassetid://14368321228',
	['guiv4.png'] = 'rbxassetid://14368322199',
	['guivape.png'] = 'rbxassetid://14657521312',
	['info.png'] = 'rbxassetid://14368324807',
	['inventoryicon.png'] = 'rbxassetid://14928011633',
	['legit.png'] = 'rbxassetid://14425650534',
	['legittab.png'] = 'rbxassetid://14426740825',
	['miniicon.png'] = 'rbxassetid://14368326029',
	['notification.png'] = 'rbxassetid://16738721069',
	['overlaysicon.png'] = 'rbxassetid://14368339581',
	['overlaystab.png'] = 'rbxassetid://14397380433',
	['pin.png'] = 'rbxassetid://14368342301',
	['profilesicon.png'] = 'rbxassetid://14397465323',
	['radaricon.png'] = 'rbxassetid://14368343291',
	['rainbow_1.png'] = 'rbxassetid://14368344374',
	['rainbow_2.png'] = 'rbxassetid://14368345149',
	['rainbow_3.png'] = 'rbxassetid://14368345840',
	['rainbow_4.png'] = 'rbxassetid://14368346696',
	['range.png'] = 'rbxassetid://14368347435',
	['rangearrow.png'] = 'rbxassetid://14368348640',
	['rendericon.png'] = 'rbxassetid://14368350193',
	['rendertab.png'] = 'rbxassetid://14397373458',
	['search.png'] = 'rbxassetid://14425646684',
	['targetinfoicon.png'] = 'rbxassetid://14368354234',
	['targetnpc1.png'] = 'rbxassetid://14497400332',
	['targetnpc2.png'] = 'rbxassetid://14497402744',
	['targetplayers1.png'] = 'rbxassetid://14497396015',
	['targetplayers2.png'] = 'rbxassetid://14497397862',
	['targetstab.png'] = 'rbxassetid://14497393895',
	['textguiicon.png'] = 'rbxassetid://14368355456',
	['textv4.png'] = 'rbxassetid://14368357095',
	['textvape.png'] = 'rbxassetid://14368358200',
	['utilityicon.png'] = 'rbxassetid://14368359107',
	['vape.png'] = 'rbxassetid://14373395239',
	['warning.png'] = 'rbxassetid://14368361552',
	['worldicon.png'] = 'rbxassetid://14368362492',
}

-- hook getcustomasset to return rbxassetid for known assets
local oldGetcustomasset = getcustomasset
if oldGetcustomasset then
	getgenv().getcustomasset = newcclosure(function(path)
		if type(path) == 'string' then
			-- extract filename from path (handles catrewrite/assets/new/xxx.png, badvape/assets/new/xxx.png, etc)
			local filename = path:match('[^/\\]+%.png$')
			if filename and assetIdMap[filename] then
				return assetIdMap[filename]
			end
		end
		-- fallback to original for other assets
		return oldGetcustomasset(redirectPath(path))
	end)
end

-- mock responses for specific urls
local mockResponses = {
	['github.com'] = 'currentOid":"0000000000000000000000000000000000000000"',
	['whitelist'] = '{"Announcement":{"expiretime":0,"targets":"all","text":""},"WhitelistedUsers":[],"BlacklistedUsers":{},"KillVape":false}',
	['7GrandDadPGN'] = '{"Announcement":{"expiretime":0,"targets":"all","text":""},"WhitelistedUsers":[],"BlacklistedUsers":{},"KillVape":false}',
	['PlayerWhitelist'] = '{"Announcement":{"expiretime":0,"targets":"all","text":""},"WhitelistedUsers":[],"BlacklistedUsers":{},"KillVape":false}',
	['servers/Public'] = '{"data":[]}',
	['Announcement'] = '',
}

-- convert github url to local path
local repo = '4fundsagent-source/badvape'

local function urlToLocalPath(url: string): string?
	local path = url:match('raw%.githubusercontent%.com/4fundsagent%-source/badvape/[^/]+/(.+)')
	if path then
		return folder .. '/' .. path
	end
	return nil
end

-- get mock response for url
local function getMockResponse(url: string): string?
	for pattern, response in pairs(mockResponses) do
		if url:find(pattern, 1, true) then
			return response
		end
	end
	return nil
end

-- hook httpget via namecall
local gameMT = getrawmetatable(game)
local oldNamecall = gameMT.__namecall

setreadonly(gameMT, false)
gameMT.__namecall = newcclosure(function(self, ...)
	local method = getnamecallmethod()
	local args = {...}

	if method == 'HttpGet' or method == 'HttpGetAsync' then
		local url = args[1] or ''

		if type(url) == 'string' and url:find('4fundsagent-source/badvape', 1, true) then
			return oldNamecall(self, ...)
		end

		local localPath = urlToLocalPath(url)
		if localPath and isfile(localPath) then
			return readfile(localPath)
		end

		local mock = getMockResponse(url)
		if mock then
			return mock
		end

		return '{}'
	end

	return oldNamecall(self, ...)
end)
setreadonly(gameMT, true)

-- hook request/syn.request
local oldRequest = request or http_request or (syn and syn.request)

if oldRequest then
	local function blockedRequest(opts)
		local url = type(opts) == 'table' and opts.Url or tostring(opts)
		local mock = getMockResponse(url)

		return {
			StatusCode = 200,
			Body = mock or '{"success":true}',
			Headers = {},
			Success = true
		}
	end

	if syn and syn.request then syn.request = newcclosure(blockedRequest) end
	if request then getgenv().request = newcclosure(blockedRequest) end
	if http_request then getgenv().http_request = newcclosure(blockedRequest) end
end

-- login stub
local loginStub = [[
print('[BADVAPE] auth bypassed')
return true
]]

-- hook loadstring to intercept login.lua
local realLoadstring = loadstring

getgenv().loadstring = newcclosure(function(code, chunkname, ...)
	chunkname = chunkname or ''

	-- intercept login.lua (luraph obfuscated)
	if chunkname:lower():find('login') and code and code:find('Luraph', 1, true) then
		return realLoadstring(loginStub, 'login_crack')
	end

	return realLoadstring(code, chunkname, ...)
end)

-- start
repeat task.wait() until game:IsLoaded()
local lplr = game:GetService('Players').LocalPlayer
repeat task.wait() until lplr
repeat task.wait() until lplr:FindFirstChild('PlayerGui')

print('========================================')
print('  offlined')
print('  user: ' .. config.username)
print('  role: ' .. config.role)
print('========================================')

local commit = 'main'
local repoUrl = 'https://raw.githubusercontent.com/' .. repo .. '/' .. commit

local loaderCode
if isfile(folder .. '/loader.luau') then
	loaderCode = oldReadfile(folder .. '/loader.luau')
else
	loaderCode = game:HttpGet(repoUrl .. '/loader.luau')
end

local success, err = pcall(function()
	realLoadstring(loaderCode, 'loader')({Key = 'cracked'}, commit)
end)

if not success then
	warn('[!] Error: ' .. tostring(err))
end
