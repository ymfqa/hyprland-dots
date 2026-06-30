------------
-- 显示器 --
------------
-- 日用分辨率
-- 显示器在右边
hl.monitor({
	output = "DP-1", --核显
	mode = "2560x1440@180",
	position = "auto",
	scale = "auto",
})
hl.monitor({
	output = "DP-3", --独显
	mode = "2560x1440@180",
	position = "auto",
	scale = "auto",
})
hl.monitor({
	output = "HDMI-A-1", --HDMI外接
	mode = "2560x1440@144",
	position = "auto",
	scale = "auto",
})
-- 显示器在左边
-- hl.monitor({
-- 	output = "DP-1", --核显
-- 	mode = "2560x1440@180",
-- 	position = "0x0",
-- 	scale = "auto",
-- })
-- hl.monitor({
-- 	output = "DP-3", --独显
-- 	mode = "2560x1440@180",
-- 	position = "0x0",
-- 	scale = "auto",
-- })
hl.monitor({
	output = "eDP-1", --笔记本自带屏幕
	mode = "2560x1440@165",
	position = "auto",
	scale = "1.3333334",
})
-- 上课用分辨率
-- hl.monitor({
-- 	output = "eDP-1", --笔记本自带屏幕
-- 	mode = "1920x1080@60",
-- 	position = "auto",
-- 	scale = "auto",
-- })
-- hl.monitor({
-- 	output = "DP-3", --独显
-- 	mode = "1920x1080@60",
-- 	position = "auto",
-- 	scale = "auto",
-- 	mirror = "eDP-1",
-- })
-- hl.monitor({
-- 	output = "HDMI-A-1", --HDMI外接
-- 	mode = "1920x1080@60",
-- 	position = "auto",
-- 	scale = "1",
-- 	mirror = "eDP-1",
-- })

------------------
-- 一些程序变量 --
------------------

local terminal = "kitty" --终端
local fileManager = "thunar" --文件管理器
local menu = "wofi --show drun" --程序启动器
local edit = "neovide" --编辑器

--------------
-- 开机自启 --
--------------

hl.on("hyprland.start", function()
	hl.exec_cmd("copyq") --剪贴板
	hl.exec_cmd("waybar") --状态栏
	hl.exec_cmd("hyprpaper") --壁纸软件
	hl.exec_cmd("asusctl profile set Balanced") --电脑默认均衡模式
	hl.exec_cmd("python /home/hamster/.connect_student_wifi.py") --自动连校园网
	hl.exec_cmd("fcitx5") --输入法
	hl.exec_cmd("mako") --消息通知
	-- hl.exec_cmd("mpvpaper ALL /home/hamster/Videos/wallpaper2.MP4 -o '--loop-file=inf --video-zoom=0.1'") --动态壁纸
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP") --启动portal
end)

--------------
-- 环境变量 --
--------------
-- 鼠标
hl.env("XCURSOR_SIZE", "24") --x11的鼠标大小
hl.env("HYPRCURSOR_SIZE", "24") --安装了hyprcursor的鼠标大小
-- hl.env("HYPRCURSOR_THEME","rose-pine-hyprcursor") --鼠标主题
-- 中文
hl.env("LANG", "zh_CN.UTF-8")
hl.env("LANGUAGE", "zh_CN:en_US")
-- nvidia
hl.env("NVD_BACKEND", "direct")
-- tmux
hl.env("TERM", "xterm-256color")
-- fcitx
hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
-- gdk应用
hl.env("GDK_BACKEND", "wayland")
hl.env("GDK_SCALE", "1.5")
-- electron变量
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("ELECTRON_ENABLE_WAYLAND_IME", "1")
hl.env("ELECTRON_FORCE_WAYLAND", "1")
--------------
-- 应用权限 --
--------------

-- 暂时没配置，没啥权限需要管的，这里默认都是ask
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

---------------
-- 视觉效果 --
--------------

hl.config({
	general = {
		-- 间距
		gaps_in = 5, -- 窗口间间距
		gaps_out = 20, -- 窗口距离屏幕边缘间距
		-- 边距
		border_size = 2, -- 边距宽度
		-- 边距颜色
		col = {
			active_border = { colors = { "rgba(BEFAFFdf)", "rgba(B487FFdf)" }, angle = 55 },
			inactive_border = "rgba(777777aa)",
		},
		-- 通过点击和拖拽边框和空隙实现窗口大小调整
		resize_on_border = false,
		-- 是否允许撕裂发生
		allow_tearing = false,
		-- 布局方式
		layout = "dwindle",
	},
	-- 装饰
	decoration = {
		-- 圆角
		rounding = 12,
		rounding_power = 6,
		-- 透明度
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		-- 窗口变暗
		dim_inactive = true,
		dim_strength = 0.05,
		-- 阴影
		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		-- 透明度
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			-- 优化模糊
			new_optimizations = true,
			-- 颜色饱和度
			vibrancy = 0.1696,
		},
	},
})

-- 贝塞尔曲线（使用这些hypr预定义的就好)
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
-- hypr预定义的动画（西贝动画)
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- 树状分割布局（默认的就是这个）
hl.config({
	dwindle = {
		preserve_split = true, -- 如果启用了，无论容器发生什么变化，分段（侧面/顶部）都不会改变。
	},
})

-- 主次布局
hl.config({
	master = {
		new_status = "master",
	},
})

-- 滚动布局(niri平替？)
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

------------
--  杂项  --
------------
hl.config({
	misc = {
		force_default_wallpaper = 0, -- 不要看见hyprland女孩壁纸
		disable_hyprland_logo = true, -- 关闭hyprland loge和hyprland女孩:(
		disable_splash_rendering = true, -- 关闭tips
		disable_watchdog_warning = true, -- 关闭不使用start-hyprland警告，其实只对sddm有点用
	},
})

------------
--  输入  --
------------
hl.config({
	input = {
		-- 键盘布局
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		-- 焦点跟随鼠标(1的话鼠标到哪就激活哪个窗口)
		follow_mouse = 1,
		-- 鼠标灵敏度
		sensitivity = 0,
		-- 触摸板
		touchpad = {
			natural_scroll = true, -- 自然滚动(true就和win一样)
		},
	},
	cursor = {
		no_hardware_cursors = 1,
	},
})
-- 触摸板手势
-- 4指在工作区之间滑动
hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "workspace",
})
-- 3指拖动窗口
hl.gesture({
	fingers = 3,
	direction = "swipe",
	action = "move",
})
--------------
-- 按键绑定 --
--------------

local mainMod = "SUPER" -- 主键(win键)

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal)) -- 打开终端
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- 打开文件管理器
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(edit)) -- 打开文件管理器
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu)) -- 打开应用菜单
hl.bind(mainMod .. " + C", hl.dsp.window.close()) -- 关闭窗口
hl.bind(mainMod .. " + M", hl.dsp.exit()) -- 退出hyprland
hl.bind(mainMod .. " + Z", hl.dsp.window.float({ action = "toggle" })) -- 浮动窗口
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen()) -- 全屏
hl.bind(mainMod .. " + P", hl.dsp.window.pin()) -- 固定应用在最上层(仅浮动窗口)
hl.bind(mainMod .. " + K", hl.dsp.dpms("toggle")) -- 熄屏
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- 切换dwindle窗口方向(横着或者竖着分割)
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("copyq toggle")) -- 打开剪贴板
hl.bind("HOME", hl.dsp.exec_cmd("hyprcap shot -s region -c -z")) -- 截屏
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock")) -- 锁屏

-- 窗口之间切换
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- 工作区之间 主键+数字切换
-- 窗口通过 主键+shift+数字 移动到对应工作区
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- 特殊工作区
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- 鼠标滚轮切换工作区
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- 拖动窗口和更改窗口大小
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- 笔记本的音量和亮度快捷键预设
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- 上一曲和下一曲
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------
-- 窗口规则 --
--------------

-- 默认最大化应用
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

-- 修了XWayland一些问题
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

--------------
-- xwayland --
--------------
hl.config({ xwayland = {
	force_zero_scaling = true,
} })
