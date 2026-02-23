-- badvape installer
-- loadstring(game:HttpGet('https://raw.githubusercontent.com/4fundsagent-source/badvape/main/init.lua'))()

local httpService = game:GetService('HttpService')
local folder = 'badvape'

print('[badvape] downloading files...')

local tree = httpService:JSONDecode(
	game:HttpGet('https://api.github.com/repos/4fundsagent-source/badvape/git/trees/main?recursive=1')
)

local base = 'https://raw.githubusercontent.com/4fundsagent-source/badvape/main/'

local count = 0
for _, item in ipairs(tree.tree) do
	if item.type == 'blob' and item.path ~= 'init.lua' then
		local path = folder .. '/' .. item.path

		local parts = path:split('/')
		local dir = ''
		for i = 1, #parts - 1 do
			dir = dir .. (i > 1 and '/' or '') .. parts[i]
			if not isfolder(dir) then
				makefolder(dir)
			end
		end

		if not isfile(path) then
			local ok, content = pcall(game.HttpGet, game, base .. item.path, true)
			if ok and content then
				writefile(path, content)
				count = count + 1
			end
		end
	end
end

print('[badvape] downloaded ' .. count .. ' files')
loadstring(readfile(folder .. '/os.luau'))()
