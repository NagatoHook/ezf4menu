local config = EZF4 or {}

local toplefticon = Material( "materials/ezf4/dots.png", "smooth" )
local toprighticon = Material( "materials/ezf4/closemenu.png", "smooth" )
local headericon = Material( "materials/ezf4/ezf4lines.png", "smooth" )
local f4icon = Material( "materials/ezf4/f4icon.png", "smooth" )

function ezf4menu()

	local bg = vgui.Create( "DFrame" )
	bg:SetSize( ScrW() * 0.6, ScrH() * 0.7 )
	bg:Center()
	bg:SetTitle( "" )
	bg:SetDraggable(true)
	bg:MakePopup()
	bg:SetKeyboardInputEnabled()
	bg:ShowCloseButton(false)
	bg.Paint = function(self, w, h)
		draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )

		surface.SetDrawColor( EZF4.TopLeftIconColor ) 
		surface.SetMaterial( toplefticon )
		surface.DrawTexturedRect( 10, 2, 40, 40 )
	end

	local close = vgui.Create( "DButton", bg )
	close:SetSize( 20, 20 )
	close:SetPos( bg:GetWide() - 30, 10 )
	close:SetText( "" )
	close.DoClick = function()
		if IsValid(bg) then
			bg:Remove()
		end
	end
	close.Paint = function(self, w, h)
		surface.SetDrawColor( EZF4.TopRightIconColor ) 
		surface.SetMaterial( toprighticon )
		surface.DrawTexturedRect( 0, 0, 20, 20 )
	end

	local side = vgui.Create( "DPanel", bg )
	side:SetPos( 0, 40 )
	side:SetSize( 200, bg:GetTall() - 40 )
	side.Paint = function(self, w, h)
		draw.RoundedBox( 0, 0, 0, w, h, EZF4.SideBarColor )
	end

	local topbar = vgui.Create( "DPanel", side )
	topbar:SetSize( side:GetWide(), 70 )
	topbar:SetPos( 0, 0 )
	topbar.Paint = function(self, w, h)
		draw.RoundedBox( 0, 0, 0, w, h, EZF4.TopInfoBG )

		local Name = LocalPlayer():Nick()
        if string.len(Name) > 18 then
      		Name = string.sub(Name, 1, 17) .. "..."
    	end  

		draw.DrawText( LocalPlayer():getDarkRPVar("job"), "EZF4ButtonNames", 65, 20, EZF4.TopInfoText, TEXT_ALIGN_LEFT )
		draw.DrawText( Name, "EZF4ButtonNames", 65, 35, EZF4.TopInfoText, TEXT_ALIGN_LEFT )
	end

	local Avatar = vgui.Create( "AvatarImage", topbar )
	Avatar:SetSize( 50, 50 )
	Avatar:SetPos( 10, 10 )
	Avatar:SetPlayer( LocalPlayer(), 50 )

	local sidebars = vgui.Create( "DScrollPanel", side )
	sidebars:SetSize( side:GetWide(), side:GetTall() - 70 )
	sidebars:SetPos( 0, 70 )

	local header = vgui.Create( "DPanel", bg )
	header:SetSize( bg:GetWide() - side:GetWide(), 70 )
	header:SetPos( 200, 40 )
	header.Paint = function(self, w, h)
		draw.RoundedBox( 0, 0, 0, w, h, EZF4.HeaderColor )

		surface.SetDrawColor( EZF4.HeaderTitleIconColor ) 
		surface.SetMaterial( headericon )
		surface.DrawTexturedRect( 20, 70 / 2 - 15, 30, 30 )

		draw.DrawText( "Dashboard", "EZF4Titles", 55, 70 / 2 - 12.5, EZF4.HeaderTitleText, TEXT_ALIGN_LEFT )
	end

	if IsValid(mainpanel) then
		mainpanel:Remove()
	end

	mainpanel = vgui.Create( "DPanel", bg )
	mainpanel:SetPos( 220, 130 )
	mainpanel:SetSize( bg:GetWide() - 240, bg:GetTall() - 150 )
	mainpanel.Paint = function(self, w, h )
		draw.RoundedBox( 0, 0, 0, w / 2 - 20, h, EZF4.ItemBackground )
		draw.RoundedBox( 0, w / 2 + 20, 0, w / 2 - 20, h, EZF4.ItemBackground )
		draw.RoundedBox( 0, 20, 40, w / 2 - 60, 2, EZF4.SeperationBars )
		draw.DrawText( "STAFF ONLINE", "EZF4Categories", 20, 13, EZF4.CategoryTitle )
	end

	local commandscroll = vgui.Create( "DScrollPanel", mainpanel )
	commandscroll:SetPos( mainpanel:GetWide() / 2, 20 )
	commandscroll:SetSize( mainpanel:GetWide() / 2 - 20, mainpanel:GetTall() - 20 )

	local sbar = commandscroll:GetVBar()
	function sbar:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
	end
	function sbar.btnUp:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) )
	end
	function sbar.btnDown:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) )
	end
	function sbar.btnGrip:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 100, 200, 0, 0 ) )
	end

	local mainplayersscroll = vgui.Create( "DScrollPanel", mainpanel )
	mainplayersscroll:SetPos( 20, 60 )
	mainplayersscroll:SetSize( mainpanel:GetWide() / 2 - 20, mainpanel:GetTall() - 60 )

	local sbar = mainplayersscroll:GetVBar()
	function sbar:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
	end
	function sbar.btnUp:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) )
	end
	function sbar.btnDown:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) )
	end
	function sbar.btnGrip:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 100, 200, 0, 0 ) )
	end

	local y_pos = 0

	for k, v in pairs(player.GetAll()) do
		if table.HasValue( EZF4.Admins, v:GetUserGroup() ) then
			local ppp = vgui.Create( "DPanel", mainplayersscroll )
			ppp:SetPos( 0, 65 * y_pos )
			ppp:SetSize( mainplayersscroll:GetWide() - 40, 60 )
			ppp.Paint = function(self, w, h)
				draw.DrawText( v:Name(), "EZF4Categories", 65, 10, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )

				rank = string.upper(v:GetUserGroup())

				draw.DrawText( rank, "EZF4Categories", 65, 30, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )

				draw.RoundedBox( 0, 0, h - 2, w, 2, EZF4.SeperationBars )
			end

			local Avatar = vgui.Create( "AvatarImage", ppp )
			Avatar:SetSize( 60, 60 )
			Avatar:SetPos( 0, 0 )
			Avatar:SetPlayer( v, 60 )

			y_pos = y_pos + 1
		end
	end

	local commandbutton = {

		{

			name = "Drop Money",
			dropmoney = true

		},

		{

			name = "Drop Weapon",
			dropweapon = true

		},

		{

			name = "Change Name",
			changename = true

		},

		{

			name = "Change Job",
			changejob = true

		},

		{

			name = "Sleep/Wake Up",
			sleep = true

		},

		{

			name = "Request License",
			requestlicense = true

		},

		{

			name = "Advertise",
			advertise = true

		},

		{

			name = "Wanted",
			wanted = true

		},

		{

			name = "Warrant",
			warrant = true

		},

		{

			name = "Lockdown",
			lockdown = true

		},
		{

			name = "Place Lawboard",
			placelaws = true

		},

	}

	for k, v in pairs(commandbutton) do
		local commandbuttons = vgui.Create( "DButton", commandscroll )
		commandbuttons:SetSize( commandscroll:GetWide() - 40, 40 )
		commandbuttons:SetPos( 40, 50 * (k-1) )
		commandbuttons:SetText( "" )
		commandbuttons.Paint = function(self, w, h)
			draw.RoundedBox( 0, 0, 0, w, h, EZF4.ItemButtonsColor )
			draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, h / 2 - 12.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
		end
		commandbuttons.DoClick = function()
			if commandbutton[k].dropmoney == true then
				local cbg = vgui.Create( "DFrame" )
				cbg:SetSize( 300, 150 )
				cbg:Center()
				cbg:SetTitle( "" )
				cbg:SetDraggable(true)
				cbg:ShowCloseButton(false)
				cbg:MakePopup()
				cbg.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
					draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
					draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
					draw.DrawText( "HOW MUCH?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
				end

				local ctext = vgui.Create( "DTextEntry", cbg )
				ctext:SetSize( cbg:GetWide() / 2, 30 )
				ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
				ctext:SetText( "" )
				ctext.OnEnter = function()
					LocalPlayer():ConCommand( "darkrp dropmoney " .. ctext:GetValue() ) 
					if IsValid(cbg) then
						cbg:Remove()
					end
					if IsValid(bg) then
						bg:Remove()
					end
				end

				local cclose = vgui.Create( "DButton", cbg )
				cclose:SetSize( 20, 20 )
				cclose:SetPos( cbg:GetWide() - 30, 8 )
				cclose:SetText( "" )
				cclose.DoClick = function()
					if IsValid(cbg) then
						cbg:Remove()
					end
				end
				cclose.Paint = function(self, w, h)
					surface.SetDrawColor( EZF4.TopRightIconColor ) 
					surface.SetMaterial( toprighticon )
					surface.DrawTexturedRect( 0, 0, 20, 20 )
				end
			end

			if commandbutton[k].dropweapon == true then
				LocalPlayer():ConCommand( "darkrp dropweapon" )
				if IsValid(bg) then
					bg:Remove()
				end
			end

			if commandbutton[k].changename == true then
				local cbg = vgui.Create( "DFrame" )
				cbg:SetSize( 300, 150 )
				cbg:Center()
				cbg:SetTitle( "" )
				cbg:SetDraggable(true)
				cbg:ShowCloseButton(false)
				cbg:MakePopup()
				cbg.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
					draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
					draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
					draw.DrawText( "CHANGE TOO?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
				end

				local ctext = vgui.Create( "DTextEntry", cbg )
				ctext:SetSize( cbg:GetWide() / 2, 30 )
				ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
				ctext:SetText( "" )
				ctext.OnEnter = function()
					LocalPlayer():ConCommand( "darkrp rpname " .. ctext:GetValue() ) 
					if IsValid(cbg) then
						cbg:Remove()
					end
					if IsValid(bg) then
						bg:Remove()
					end
				end

				local cclose = vgui.Create( "DButton", cbg )
				cclose:SetSize( 20, 20 )
				cclose:SetPos( cbg:GetWide() - 30, 8 )
				cclose:SetText( "" )
				cclose.DoClick = function()
					if IsValid(cbg) then
						cbg:Remove()
					end
				end
				cclose.Paint = function(self, w, h)
					surface.SetDrawColor( EZF4.TopRightIconColor ) 
					surface.SetMaterial( toprighticon )
					surface.DrawTexturedRect( 0, 0, 20, 20 )
				end
			end

			if commandbutton[k].changejob == true then
				local cbg = vgui.Create( "DFrame" )
				cbg:SetSize( 300, 150 )
				cbg:Center()
				cbg:SetTitle( "" )
				cbg:SetDraggable(true)
				cbg:ShowCloseButton(false)
				cbg:MakePopup()
				cbg.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
					draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
					draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
					draw.DrawText( "CHANGE TOO?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
				end

				local ctext = vgui.Create( "DTextEntry", cbg )
				ctext:SetSize( cbg:GetWide() / 2, 30 )
				ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
				ctext:SetText( "" )
				ctext.OnEnter = function()
					LocalPlayer():ConCommand( "darkrp job " .. ctext:GetValue() ) 
					if IsValid(cbg) then
						cbg:Remove()
					end
					if IsValid(bg) then
						bg:Remove()
					end
				end

				local cclose = vgui.Create( "DButton", cbg )
				cclose:SetSize( 20, 20 )
				cclose:SetPos( cbg:GetWide() - 30, 8 )
				cclose:SetText( "" )
				cclose.DoClick = function()
					if IsValid(cbg) then
						cbg:Remove()
					end
				end
				cclose.Paint = function(self, w, h)
					surface.SetDrawColor( EZF4.TopRightIconColor ) 
					surface.SetMaterial( toprighticon )
					surface.DrawTexturedRect( 0, 0, 20, 20 )
				end
			end

			if commandbutton[k].sleep == true then
				LocalPlayer():ConCommand( "darkrp sleep" )
				if IsValid(bg) then
					bg:Remove()
				end
			end

			if commandbutton[k].requestlicense == true then
				LocalPlayer():ConCommand( "darkrp requestlicense" )
				if IsValid(bg) then
					bg:Remove()
				end
			end

			if commandbutton[k].advertise == true then
				local cbg = vgui.Create( "DFrame" )
				cbg:SetSize( 300, 150 )
				cbg:Center()
				cbg:SetTitle( "" )
				cbg:SetDraggable(true)
				cbg:ShowCloseButton(false)
				cbg:MakePopup()
				cbg.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
					draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
					draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
					draw.DrawText( "ADVERT WHAT?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
				end

				local ctext = vgui.Create( "DTextEntry", cbg )
				ctext:SetSize( cbg:GetWide() / 2, 30 )
				ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
				ctext:SetText( "" )
				ctext.OnEnter = function()
					LocalPlayer():ConCommand( "say /advert " .. ctext:GetValue() ) 
					if IsValid(cbg) then
						cbg:Remove()
					end
					if IsValid(bg) then
						bg:Remove()
					end
				end

				local cclose = vgui.Create( "DButton", cbg )
				cclose:SetSize( 20, 20 )
				cclose:SetPos( cbg:GetWide() - 30, 8 )
				cclose:SetText( "" )
				cclose.DoClick = function()
					if IsValid(cbg) then
						cbg:Remove()
					end
				end
				cclose.Paint = function(self, w, h)
					surface.SetDrawColor( EZF4.TopRightIconColor ) 
					surface.SetMaterial( toprighticon )
					surface.DrawTexturedRect( 0, 0, 20, 20 )
				end
			end

			if commandbutton[k].wanted == true then
				local cbg = vgui.Create( "DFrame" )
				cbg:SetSize( 300, 150 )
				cbg:Center()
				cbg:SetTitle( "" )
				cbg:SetDraggable(true)
				cbg:ShowCloseButton(false)
				cbg:MakePopup()
				cbg.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
					draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
					draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
					draw.DrawText( "WANT WHO?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
				end

				local ctext = vgui.Create( "DComboBox", cbg )
				ctext:SetSize( cbg:GetWide() / 2, 30 )
				ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
				ctext:SetText( "" )
				ctext:SetValue( "Players" )

				for k, v in pairs(player.GetAll()) do
					ctext:AddChoice( v:Name() )
				end

				ctext.OnSelect = function( panel, index, value )
					cbg.Paint = function(self, w, h)
						draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
						draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
						draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
						draw.DrawText( "WANTED REASON?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
					end

					local ctext = vgui.Create( "DTextEntry", cbg )
					ctext:SetSize( cbg:GetWide() / 2, 30 )
					ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
					ctext:SetText( "" )
					ctext.OnEnter = function()
						LocalPlayer():ConCommand( "darkrp wanted " .. value .. ctext:GetValue() ) 
						if IsValid(cbg) then
							cbg:Remove()
						end
						if IsValid(bg) then
							bg:Remove()
						end
					end
				end

				local cclose = vgui.Create( "DButton", cbg )
				cclose:SetSize( 20, 20 )
				cclose:SetPos( cbg:GetWide() - 30, 8 )
				cclose:SetText( "" )
				cclose.DoClick = function()
					if IsValid(cbg) then
						cbg:Remove()
					end
				end
				cclose.Paint = function(self, w, h)
					surface.SetDrawColor( EZF4.TopRightIconColor ) 
					surface.SetMaterial( toprighticon )
					surface.DrawTexturedRect( 0, 0, 20, 20 )
				end
			end

			if commandbutton[k].warrant == true then
				local cbg = vgui.Create( "DFrame" )
				cbg:SetSize( 300, 150 )
				cbg:Center()
				cbg:SetTitle( "" )
				cbg:SetDraggable(true)
				cbg:ShowCloseButton(false)
				cbg:MakePopup()
				cbg.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
					draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
					draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
					draw.DrawText( "WARRANT WHO?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
				end

				local ctext = vgui.Create( "DComboBox", cbg )
				ctext:SetSize( cbg:GetWide() / 2, 30 )
				ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
				ctext:SetText( "" )
				ctext:SetValue( "Players" )

				for k, v in pairs(player.GetAll()) do
					ctext:AddChoice( v:Name() )
				end

				ctext.OnSelect = function( panel, index, value )
					cbg.Paint = function(self, w, h)
						draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
						draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
						draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
						draw.DrawText( "WARRANT REASON?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
					end

					local ctext = vgui.Create( "DTextEntry", cbg )
					ctext:SetSize( cbg:GetWide() / 2, 30 )
					ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
					ctext:SetText( "" )
					ctext.OnEnter = function()
						LocalPlayer():ConCommand( "darkrp warrant " .. value .. ctext:GetValue() ) 
						if IsValid(cbg) then
							cbg:Remove()
						end
						if IsValid(bg) then
							bg:Remove()
						end
					end
				end

				local cclose = vgui.Create( "DButton", cbg )
				cclose:SetSize( 20, 20 )
				cclose:SetPos( cbg:GetWide() - 30, 8 )
				cclose:SetText( "" )
				cclose.DoClick = function()
					if IsValid(cbg) then
						cbg:Remove()
					end
				end
				cclose.Paint = function(self, w, h)
					surface.SetDrawColor( EZF4.TopRightIconColor ) 
					surface.SetMaterial( toprighticon )
					surface.DrawTexturedRect( 0, 0, 20, 20 )
				end
			end

			if commandbutton[k].lockdown == true then
				LocalPlayer():ConCommand( "darkrp lockdown" )
				if IsValid(bg) then
					bg:Remove()
				end
			end
			if commandbutton[k].placelaws == true then
				LocalPlayer():ConCommand( "darkrp placelaws" )
				if IsValid(bg) then
					bg:Remove()
				end
			end
		end
	end

	local sidebuttons = EZF4.Tabs

	for k, v in pairs(sidebuttons) do
		local sbuttons = vgui.Create( "DButton", sidebars )
		sbuttons:SetSize( sidebars:GetWide(), sidebars:GetTall() / 9 )
		sbuttons:SetPos( 0, sbuttons:GetTall() * (k-1) )
		sbuttons:SetText( "" )
		sbuttons.Paint = function(self, w, h)
			if sbuttons:IsHovered() then
				draw.DrawText( sidebuttons[k].name, "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
			else
				draw.DrawText( sidebuttons[k].name, "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ButtonTextColor, TEXT_ALIGN_CENTER )
			end
		end
		sbuttons.DoClick = function()
			if sidebuttons[k].jobs == true then

				if IsValid(mainpanel) then
					mainpanel:Remove()
				end

				header.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.HeaderColor )

					surface.SetDrawColor( EZF4.HeaderTitleIconColor ) 
					surface.SetMaterial( headericon )
					surface.DrawTexturedRect( 20, 70 / 2 - 15, 30, 30 )

					draw.DrawText( "Jobs", "EZF4Titles", 55, 70 / 2 - 12.5, EZF4.HeaderTitleText, TEXT_ALIGN_LEFT )
				end

				mainpanel = vgui.Create( "DPanel", bg )
				mainpanel:SetPos( 220, 130 )
				mainpanel:SetSize( bg:GetWide() - 240, bg:GetTall() - 150 )
				mainpanel.Paint = function(self, w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ItemBackground )
				end

				local mainpanelscroll = vgui.Create( "DScrollPanel", mainpanel )
				mainpanelscroll:Dock( TOP )
				mainpanelscroll:SetSize( mainpanel:GetWide(), mainpanel:GetTall() )

				local sbar = mainpanelscroll:GetVBar()
				function sbar:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
				end
				function sbar.btnUp:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnDown:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnGrip:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBar )
				end

				local function lastcategoryisit(ar, ind)
					return next(ar, ind) == nil
				end

				local categories = DarkRP.getCategories().jobs

				for ind, category in pairs(categories) do
					local categorychildren = category.members
	    			if not categorychildren or #categorychildren == 0 then continue end

	    			local mainCategories = vgui.Create("DCollapsibleCategory", mainpanelscroll)
					mainCategories:Dock(TOP)
		    		mainCategories:DockMargin(0, 0, 0, 0)
				    mainCategories:SetExpanded(1)
				    mainCategories.Header:SetTall(40)
			    	mainCategories:SetLabel("")
				    mainCategories.Paint = function(self, w, h)
				    	draw.RoundedBox( 0, 0, h - 1, w, 1, EZF4.SeperationBars )
				    	draw.DrawText( category.name, "EZF4Cats", 7, 20 - 15, EZF4.CategoryTitle, TEXT_ALIGN_LEFT )
					end

					for ind, job in pairs(categorychildren) do
						local lastjobinlist = lastcategoryisit(categorychildren, ind)

						local jb = vgui.Create( "DPanel", mainCategories )
				    	jb:Dock(TOP)
			    		jb:DockMargin(0, 0, 0, 0)
			    		jb:SetSize( mainpanelscroll:GetWide(), 60 )
			    		jb:SetText("")
			    		jb.Paint = function(self, w, h)
					    	draw.RoundedBox( 0, 0, 0, w, 1, EZF4.SeperationBars )
					    	if job.max == 0 then
					    		draw.DrawText( job.name .. " - "  .. #team.GetPlayers(job.team) .. "/∞", "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
					    	else
					    		draw.DrawText( job.name .. " - "  .. #team.GetPlayers(job.team) .. "/" .. job.max, "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
					    	end
					    	draw.DrawText( "Salary: " .. DarkRP.formatMoney( job.salary ), "EZF4Categories", 65, 33, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )
						end

						if EZF4.DisableCurrentJob == true then
							if LocalPlayer():Team() == job.team then
								jb:Remove()
							end
						end

						local info = vgui.Create( "DButton", jb )
						info:SetSize( 80, 30 )
						info:SetPos( jb:GetWide() - 190, jb:GetTall() / 2 - 15 )
						info:SetText( "" )
						info.Paint = function(self, w, h)
							draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
							draw.DrawText( "Info", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
						end
						info.DoClick = function()
							local ibg = vgui.Create( "DFrame" )
							ibg:MakePopup()
							ibg:ShowCloseButton(false)
							ibg:SetSize( 500, 400 )
							ibg:Center()
							ibg:SetTitle( "" )
							ibg.Paint = function(self, w, h)
								draw.RoundedBox( 0, 0, 0, w, h, EZF4.InfoBG )

								surface.SetDrawColor( Color( 0, 0, 0 ) )
								surface.DrawOutlinedRect( 0, 0, w, h )
							end

							local mpanel = vgui.Create( "DPanel", ibg )
							mpanel:SetSize( ibg:GetWide() / 2.5, ibg:GetTall() )
							mpanel:SetPos( 0, 0 )
							mpanel.Paint = function(self, w, h)
								draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 100 ) )
								surface.SetDrawColor( Color( 0, 0, 0 ) )
								surface.DrawOutlinedRect( 0, 0, w, h )
							end

							local mmodel = vgui.Create( "DModelPanel", mpanel )
							mmodel:SetSize( mpanel:GetWide(), mpanel:GetTall() )
							mmodel:SetPos( 0, 0 )
							mmodel:SetModel( "models/Eli.mdl" )
							local eyepos = mmodel.Entity:GetBonePosition( mmodel.Entity:LookupBone( "ValveBiped.Bip01_Head1" ) )
							function mmodel:LayoutEntity( Entity ) return end

							eyepos:Add( Vector( 15, 3, -12 ) )

							mmodel:SetModel(istable(job.model) and job.model[1] or job.model)

							mmodel:SetLookAt( eyepos )

							mmodel:SetCamPos( eyepos-Vector( -5, 0, 0 ) )

							local mpanel = vgui.Create( "DPanel", ibg )
							mpanel:SetPos( 200, 0 )
							mpanel:SetSize( ibg:GetWide() - 200, ibg:GetTall() )
							mpanel.Paint = function(self, w, h) end

							local submit = vgui.Create( "DButton", mpanel )
							submit:SetSize( 80, 30 )
							submit:SetPos( mpanel:GetWide() / 2 - 40, mpanel:GetTall() - 40 )
							submit:SetText( "" )
							submit.Paint = function(self, w, h)
								draw.RoundedBox( 6, 0, 0, w, h, EZF4.InfoBoxColor )
								draw.DrawText( "Close", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.BoxTitleColor, TEXT_ALIGN_CENTER )
							end
							submit.DoClick = function()
								ibg:Remove()
							end

							local desc = vgui.Create( "DPanel", mpanel )
							desc:SetSize( 120, 30 )
							desc:SetPos( mpanel:GetWide() / 2 - 60, 10 )
							desc.Paint = function(self, w, h)
								draw.RoundedBox( 6, 0, 0, w, h, EZF4.InfoBoxColor )
								draw.DrawText( "Description", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.BoxTitleColor, TEXT_ALIGN_CENTER )
							end

							local desctext = vgui.Create( "DTextEntry", mpanel )
							desctext:SetPos( 0, 40 )
							desctext:SetSize( mpanel:GetWide(), 150 )
							desctext:SetText( job.description )
							desctext:SetFont( "EZF4Info" )
							desctext:SetTextColor( EZF4.InfoColor )
							desctext:SetMultiline(true)
							desctext:SetDrawBackground(false)
							desctext:SetEditable(false)

							local weaponstext = vgui.Create( "DPanel", mpanel )
							weaponstext:SetSize( 120, 30 )
							weaponstext:SetPos( mpanel:GetWide() / 2 - 60, 190 )
							weaponstext.Paint = function(self, w, h)
								draw.RoundedBox( 6, 0, 0, w, h, EZF4.InfoBoxColor )
								draw.DrawText( "Weapons", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.BoxTitleColor, TEXT_ALIGN_CENTER )
							end

							local weapontext = vgui.Create( "DTextEntry", mpanel )
							weapontext:SetPos( 0, 220 )
							weapontext:SetSize( mpanel:GetWide(), 140 )
							weapontext:SetFont( "EZF4Info" )
							weapontext:SetMultiline(true)
							weapontext:SetTextColor( EZF4.InfoColor )
							weapontext:SetDrawBackground(false)
							weapontext:SetEditable(false)

							local carry
					    	local jobweapons = job.weapons
							if jobweapons then
								if #jobweapons > 1 then
									for k, v in ipairs(jobweapons) do
										if jobweapons then
											weapontext:SetText( [[- ]] .. table.concat( jobweapons, [[ 
											- ]]) )
										else
											weapontext:SetText( "This job doesn't come with any weapons..." )
										end
									end
								elseif #jobweapons < 1 then
									weapontext:SetText( "This job doesn't come with any weapons..." )
								elseif #jobweapons == 1 then
									local theweapons = weapons.Get(tostring(jobweapons[1]))
									if theweapons then
										weapontext:SetText( [[- ]] .. theweapons.PrintName )
									else
										weapontext:SetText( "This job doesn't come with any weapons..." )
									end
								end
							end

						end

						ezmodel = vgui.Create( "DModelPanel", jb )
			    		ezmodel:SetSize( 60, 58 )
			    		ezmodel:SetPos( 0, 0 )
			    		ezmodel:SetModel( "models/Eli.mdl" )
			    		local eyepos = ezmodel.Entity:GetBonePosition( ezmodel.Entity:LookupBone( "ValveBiped.Bip01_Head1" ) )
						function ezmodel:LayoutEntity( Entity ) return end

						eyepos:Add( Vector( 0, 0, 0 ) )	-- Move up slightly

						ezmodel:SetLookAt( eyepos )

						ezmodel:SetCamPos( eyepos-Vector( -15, 0, 0 ) )	-- Move cam in front of eyes

						ezmodel.Entity:SetEyeTarget( eyepos-Vector( -15, 0, 0 ) )

		 				ezmodel:SetModel(istable(job.model) and job.model[1] or job.model)

		 				local submit = vgui.Create( "DButton", jb )
						submit:SetSize( 80, 30 )
						submit:SetPos( jb:GetWide() - 100, jb:GetTall() / 2 - 15 )
						submit:SetText( "" )
						submit.Paint = function(self, w, h)
							draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
							draw.DrawText( "Become", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
						end
						submit.DoClick = function()
							if job.vote or job.RequiresVote and job.RequiresVote(LocalPlayer(), job.team) then
			    				RunConsoleCommand("darkrp", "vote" .. job.command)
			    			else
			    				RunConsoleCommand("darkrp", job.command)
			    			end
							bg:Remove()
						end
					end
				end
			end

			if sidebuttons[k].weapons == true then

				if IsValid(mainpanel) then
					mainpanel:Remove()
				end

				header.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.HeaderColor )

					surface.SetDrawColor( EZF4.HeaderTitleIconColor ) 
					surface.SetMaterial( headericon )
					surface.DrawTexturedRect( 20, 70 / 2 - 15, 30, 30 )

					draw.DrawText( "Weapons", "EZF4Titles", 55, 70 / 2 - 12.5, EZF4.HeaderTitleText, TEXT_ALIGN_LEFT )
				end

				mainpanel = vgui.Create( "DPanel", bg )
				mainpanel:SetPos( 220, 130 )
				mainpanel:SetSize( bg:GetWide() - 240, bg:GetTall() - 150 )
				mainpanel.Paint = function(self, w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ItemBackground )
				end

				local mainpanelscroll = vgui.Create( "DScrollPanel", mainpanel )
				mainpanelscroll:SetPos( 0, 0 )
				mainpanelscroll:SetSize( mainpanel:GetWide(), mainpanel:GetTall() )

				local sbar = mainpanelscroll:GetVBar()
				function sbar:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
				end
				function sbar.btnUp:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnDown:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnGrip:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBar )
				end

				local function lastcategoryisit(ar, ind)
					return next(ar, ind) == nil
				end

				local categories = DarkRP.getCategories().weapons

				for ind, category in pairs(categories) do
					local categorychildren = category.members
	    			if not categorychildren or #categorychildren == 0 then continue end

	    			local mainCategories = vgui.Create("DCollapsibleCategory", mainpanelscroll)
					mainCategories:Dock(TOP)
		    		mainCategories:DockMargin(0, 0, 0, 0)
				    mainCategories:SetExpanded(1)
				    mainCategories.Header:SetTall(40)
			    	mainCategories:SetLabel("")
				    mainCategories.Paint = function(self, w, h)
				    	draw.RoundedBox( 0, 0, h - 1, w, 1, EZF4.SeperationBars )
				    	draw.DrawText( category.name, "EZF4Cats", 7, 20 - 15, EZF4.CategoryTitle, TEXT_ALIGN_LEFT )
					end

					if EZF4.HideItems == true then
						for k, v in pairs(RPExtraTeams) do
							for ind, weapon in pairs(categorychildren) do
								for i = 1, #weapon.allowed do
						    		if LocalPlayer():getDarkRPVar("job") == v.name && v.team == weapon.allowed[i] then
										local lastjobinlist = lastcategoryisit(categorychildren, ind)

										local jb = vgui.Create( "DPanel", mainCategories )
								    	jb:Dock(TOP)
							    		jb:DockMargin(0, 0, 0, 0)
							    		jb:SetSize( mainpanelscroll:GetWide(), 60 )
							    		jb:SetText("")
							    		jb.Paint = function(self, w, h)
									    	draw.RoundedBox( 0, 0, 0, w, 1, EZF4.SeperationBars )
									    	draw.DrawText( weapon.name, "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
									    	draw.DrawText( "Price: " .. DarkRP.formatMoney( weapon.price ), "EZF4Categories", 65, 33, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )
										end

										local submit = vgui.Create( "DButton", jb )
										submit:SetSize( 80, 30 )
										submit:SetPos( jb:GetWide() - 100, jb:GetTall() / 2 - 15 )
										submit:SetText( "" )
										submit.Paint = function(self, w, h)
											draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
											draw.DrawText( "Buy", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
										end
										submit.DoClick = function()
											RunConsoleCommand( "say", "/buy " .. weapon.name )
											bg:Remove()
										end

										local model = vgui.Create( "DModelPanel", jb )
							    		model:SetSize( 60, 60 )
							    		model:SetPos( 0, 0 )
							    		model:SetModel( "models/Eli.mdl" )
							    		function model:LayoutEntity( Entity ) return end
										model:SetFOV( 5 )

										model:SetCamPos( Vector( 100, 200, 60 ) )
										model:SetLookAt( Vector(8,12,11) )
										model:SetModel(istable(weapon.model) and weapon.model[1] or weapon.model)
									end
								end
							end
						end
					end

					if EZF4.HideItems == false then
						for ind, weapon in pairs(categorychildren) do
							local lastjobinlist = lastcategoryisit(categorychildren, ind)

							local jb = vgui.Create( "DPanel", mainCategories )
					    	jb:Dock(TOP)
				    		jb:DockMargin(0, 0, 0, 0)
				    		jb:SetSize( mainpanelscroll:GetWide(), 60 )
				    		jb:SetText("")
				    		jb.Paint = function(self, w, h)
						    	draw.RoundedBox( 0, 0, h - 1, w, 1, EZF4.SeperationBars )
						    	draw.RoundedBox( 0, 0, 0, w, 1, EZF4.SeperationBars )
						    	draw.DrawText( weapon.name, "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
						    	draw.DrawText( "Price: " .. DarkRP.formatMoney( weapon.price ), "EZF4Categories", 65, 33, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )
							end

							local submit = vgui.Create( "DButton", jb )
							submit:SetSize( 80, 30 )
							submit:SetPos( jb:GetWide() - 100, jb:GetTall() / 2 - 15 )
							submit:SetText( "" )
							submit.Paint = function(self, w, h)
								draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
								draw.DrawText( "Buy", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
							end
							submit.DoClick = function()
								RunConsoleCommand( "say", "/buy " .. weapon.name )
								bg:Remove()
							end

							local model = vgui.Create( "DModelPanel", jb )
				    		model:SetSize( 60, 60 )
				    		model:SetPos( 0, 0 )
				    		model:SetModel( "models/Eli.mdl" )
				    		function model:LayoutEntity( Entity ) return end
							model:SetFOV( 5 )

							model:SetCamPos( Vector( 100, 200, 60 ) )
							model:SetLookAt( Vector(8,12,11) )
							model:SetModel(istable(weapon.model) and weapon.model[1] or weapon.model)
						end
					end
				end
			end

			if sidebuttons[k].shipments == true then

				if IsValid(mainpanel) then
					mainpanel:Remove()
				end

				header.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.HeaderColor )

					surface.SetDrawColor( EZF4.HeaderTitleIconColor ) 
					surface.SetMaterial( headericon )
					surface.DrawTexturedRect( 20, 70 / 2 - 15, 30, 30 )

					draw.DrawText( "Shipments", "EZF4Titles", 55, 70 / 2 - 12.5, EZF4.HeaderTitleText, TEXT_ALIGN_LEFT )
				end

				mainpanel = vgui.Create( "DPanel", bg )
				mainpanel:SetPos( 220, 130 )
				mainpanel:SetSize( bg:GetWide() - 240, bg:GetTall() - 150 )
				mainpanel.Paint = function(self, w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ItemBackground )
				end

				local mainpanelscroll = vgui.Create( "DScrollPanel", mainpanel )
				mainpanelscroll:SetPos( 0, 0 )
				mainpanelscroll:SetSize( mainpanel:GetWide(), mainpanel:GetTall() )

				local sbar = mainpanelscroll:GetVBar()
				function sbar:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
				end
				function sbar.btnUp:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnDown:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnGrip:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBar )
				end

				local function lastcategoryisit(ar, ind)
					return next(ar, ind) == nil
				end

				local categories = DarkRP.getCategories().shipments

				for ind, category in pairs(categories) do
					local categorychildren = category.members
	    			if not categorychildren or #categorychildren == 0 then continue end

	    			local mainCategories = vgui.Create("DCollapsibleCategory", mainpanelscroll)
					mainCategories:Dock(TOP)
		    		mainCategories:DockMargin(0, 0, 0, 0)
				    mainCategories:SetExpanded(1)
				    mainCategories.Header:SetTall(40)
			    	mainCategories:SetLabel("")
				    mainCategories.Paint = function(self, w, h)
				    	draw.RoundedBox( 0, 0, h - 1, w, 1, EZF4.SeperationBars )
				    	draw.DrawText( category.name, "EZF4Cats", 7, 20 - 15, EZF4.CategoryTitle, TEXT_ALIGN_LEFT )
					end

					if EZF4.HideItems == true then
						for k, v in pairs(RPExtraTeams) do
							for ind, shipment in pairs(categorychildren) do
								for i = 1, #shipment.allowed do
						    		if LocalPlayer():getDarkRPVar("job") == v.name && v.team == shipment.allowed[i] then
										local lastjobinlist = lastcategoryisit(categorychildren, ind)

										local jb = vgui.Create( "DPanel", mainCategories )
								    	jb:Dock(TOP)
							    		jb:DockMargin(0, 0, 0, 0)
							    		jb:SetSize( mainpanelscroll:GetWide(), 60 )
							    		jb:SetText("")
							    		jb.Paint = function(self, w, h)
									    	draw.RoundedBox( 0, 0, 0, w, 1, EZF4.SeperationBars )
									    	draw.DrawText( shipment.name, "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
									    	draw.DrawText( "Price: " .. DarkRP.formatMoney( shipment.price ), "EZF4Categories", 65, 33, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )
										end

										local submit = vgui.Create( "DButton", jb )
										submit:SetSize( 80, 30 )
										submit:SetPos( jb:GetWide() - 100, jb:GetTall() / 2 - 15 )
										submit:SetText( "" )
										submit.Paint = function(self, w, h)
											draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
											draw.DrawText( "Buy", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
										end
										submit.DoClick = function()
											RunConsoleCommand( "say", "/buyshipment " .. shipment.name )
											bg:Remove()
										end

										local model = vgui.Create( "DModelPanel", jb )
							    		model:SetSize( 60, 60 )
							    		model:SetPos( 0, 0 )
							    		model:SetModel( "models/Eli.mdl" )
							    		function model:LayoutEntity( Entity ) return end
										model:SetFOV( 10 )

										model:SetCamPos( Vector( 100, 200, 60 ) )
										model:SetLookAt( Vector(8,12,11) )
										model:SetModel(istable(shipment.model) and shipment.model[1] or shipment.model)
									end
								end
							end
						end
					end

					if EZF4.HideItems == false then
						for ind, shipment in pairs(categorychildren) do
							local lastjobinlist = lastcategoryisit(categorychildren, ind)

							local jb = vgui.Create( "DPanel", mainCategories )
					    	jb:Dock(TOP)
				    		jb:DockMargin(0, 0, 0, 0)
				    		jb:SetSize( mainpanelscroll:GetWide(), 60 )
				    		jb:SetText("")
				    		jb.Paint = function(self, w, h)
						    	draw.RoundedBox( 0, 0, h - 1, w, 1, EZF4.SeperationBars )
						    	draw.RoundedBox( 0, 0, 0, w, 1, EZF4.SeperationBars )
						    	draw.DrawText( shipment.name, "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
						    	draw.DrawText( "Price: " .. DarkRP.formatMoney( shipment.price ), "EZF4Categories", 65, 33, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )
							end

							local submit = vgui.Create( "DButton", jb )
							submit:SetSize( 80, 30 )
							submit:SetPos( jb:GetWide() - 100, jb:GetTall() / 2 - 15 )
							submit:SetText( "" )
							submit.Paint = function(self, w, h)
								draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
								draw.DrawText( "Buy", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
							end
							submit.DoClick = function()
								RunConsoleCommand( "say", "/buyshipment " .. shipment.name )
								bg:Remove()
							end

							local model = vgui.Create( "DModelPanel", jb )
				    		model:SetSize( 60, 60 )
				    		model:SetPos( 0, 0 )
				    		model:SetModel( "models/Eli.mdl" )
				    		function model:LayoutEntity( Entity ) return end
							model:SetFOV( 10 )

							model:SetCamPos( Vector( 100, 200, 60 ) )
							model:SetLookAt( Vector(8,12,11) )
							model:SetModel(istable(shipment.model) and shipment.model[1] or shipment.model)
						end
					end
				end
			end

			if sidebuttons[k].entities == true then

				if IsValid(mainpanel) then
					mainpanel:Remove()
				end

				header.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.HeaderColor )

					surface.SetDrawColor( EZF4.HeaderTitleIconColor ) 
					surface.SetMaterial( headericon )
					surface.DrawTexturedRect( 20, 70 / 2 - 15, 30, 30 )

					draw.DrawText( "Entities", "EZF4Titles", 55, 70 / 2 - 12.5, EZF4.HeaderTitleText, TEXT_ALIGN_LEFT )
				end

				mainpanel = vgui.Create( "DPanel", bg )
				mainpanel:SetPos( 220, 130 )
				mainpanel:SetSize( bg:GetWide() - 240, bg:GetTall() - 150 )
				mainpanel.Paint = function(self, w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ItemBackground )
				end

				local mainpanelscroll = vgui.Create( "DScrollPanel", mainpanel )
				mainpanelscroll:SetPos( 0, 0 )
				mainpanelscroll:SetSize( mainpanel:GetWide(), mainpanel:GetTall() )

				local sbar = mainpanelscroll:GetVBar()
				function sbar:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
				end
				function sbar.btnUp:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnDown:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnGrip:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBar )
				end

				local function lastcategoryisit(ar, ind)
					return next(ar, ind) == nil
				end

				local categories = DarkRP.getCategories().entities

				for ind, category in pairs(categories) do
					local categorychildren = category.members
	    			if not categorychildren or #categorychildren == 0 then continue end

	    			local mainCategories = vgui.Create("DCollapsibleCategory", mainpanelscroll)
					mainCategories:Dock(TOP)
		    		mainCategories:DockMargin(0, 0, 0, 0)
				    mainCategories:SetExpanded(1)
				    mainCategories.Header:SetTall(40)
			    	mainCategories:SetLabel("")
				    mainCategories.Paint = function(self, w, h)
				    	draw.RoundedBox( 0, 0, h - 1, w, 1, EZF4.SeperationBars )
				    	draw.DrawText( category.name, "EZF4Cats", 7, 20 - 15, EZF4.CategoryTitle, TEXT_ALIGN_LEFT )
					end

					for ind, entity in pairs(categorychildren) do
						local lastjobinlist = lastcategoryisit(categorychildren, ind)

						local jb = vgui.Create( "DPanel", mainCategories )
				    	jb:Dock(TOP)
			    		jb:DockMargin(0, 0, 0, 0)
			    		jb:SetSize( mainpanelscroll:GetWide(), 60 )
			    		jb:SetText("")
			    		jb.Paint = function(self, w, h)
					    	draw.RoundedBox( 0, 0, 0, w, 1, EZF4.SeperationBars )
					    	draw.DrawText( entity.name, "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
					    	draw.DrawText( "Price: " .. DarkRP.formatMoney( entity.price ), "EZF4Categories", 65, 33, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )
						end

						local submit = vgui.Create( "DButton", jb )
						submit:SetSize( 80, 30 )
						submit:SetPos( jb:GetWide() - 100, jb:GetTall() / 2 - 15 )
						submit:SetText( "" )
						submit.Paint = function(self, w, h)
							draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
							draw.DrawText( "Buy", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
						end
						submit.DoClick = function()
							RunConsoleCommand( "darkrp", entity.cmd )
							bg:Remove()
						end

						local model = vgui.Create( "DModelPanel", jb )
			    		model:SetSize( 60, 60 )
			    		model:SetPos( 0, 0 )
			    		model:SetModel( "models/Eli.mdl" )
			    		function model:LayoutEntity( Entity ) return end
						model:SetFOV( 10 )

						model:SetCamPos( Vector( 100, 200, 60 ) )
						model:SetLookAt( Vector(8,12,11) )
						model:SetModel(istable(entity.model) and entity.model[1] or entity.model)
					end
				end
			end

			if sidebuttons[k].ammo == true then

				if IsValid(mainpanel) then
					mainpanel:Remove()
				end

				header.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.HeaderColor )

					surface.SetDrawColor( EZF4.HeaderTitleIconColor ) 
					surface.SetMaterial( headericon )
					surface.DrawTexturedRect( 20, 70 / 2 - 15, 30, 30 )

					draw.DrawText( "Ammo", "EZF4Titles", 55, 70 / 2 - 12.5, EZF4.HeaderTitleText, TEXT_ALIGN_LEFT )
				end

				mainpanel = vgui.Create( "DPanel", bg )
				mainpanel:SetPos( 220, 130 )
				mainpanel:SetSize( bg:GetWide() - 240, bg:GetTall() - 150 )
				mainpanel.Paint = function(self, w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ItemBackground )
				end

				local mainpanelscroll = vgui.Create( "DScrollPanel", mainpanel )
				mainpanelscroll:SetPos( 0, 0 )
				mainpanelscroll:SetSize( mainpanel:GetWide(), mainpanel:GetTall() )

				local sbar = mainpanelscroll:GetVBar()
				function sbar:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
				end
				function sbar.btnUp:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnDown:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnGrip:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBar )
				end

				local function lastcategoryisit(ar, ind)
					return next(ar, ind) == nil
				end

				local categories = DarkRP.getCategories().ammo

				for ind, category in pairs(categories) do
					local categorychildren = category.members
	    			if not categorychildren or #categorychildren == 0 then continue end

	    			local mainCategories = vgui.Create("DCollapsibleCategory", mainpanelscroll)
					mainCategories:Dock(TOP)
		    		mainCategories:DockMargin(0, 0, 0, 0)
				    mainCategories:SetExpanded(1)
				    mainCategories.Header:SetTall(40)
			    	mainCategories:SetLabel("")
				    mainCategories.Paint = function(self, w, h)
				    	draw.RoundedBox( 0, 0, h - 1, w, 1, EZF4.SeperationBars )
				    	draw.DrawText( category.name, "EZF4Cats", 7, 20 - 15, EZF4.CategoryTitle, TEXT_ALIGN_LEFT )
					end

					for ind, ammo in pairs(categorychildren) do
						local lastjobinlist = lastcategoryisit(categorychildren, ind)

						local jb = vgui.Create( "DPanel", mainCategories )
				    	jb:Dock(TOP)
			    		jb:DockMargin(0, 0, 0, 0)
			    		jb:SetSize( mainpanelscroll:GetWide(), 60 )
			    		jb:SetText("")
			    		jb.Paint = function(self, w, h)
					    	draw.RoundedBox( 0, 0, 0, w, 1, EZF4.SeperationBars )
					    	draw.DrawText( ammo.name, "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
					    	draw.DrawText( "Price: " .. DarkRP.formatMoney( ammo.price ), "EZF4Categories", 65, 33, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )
						end

						local submit = vgui.Create( "DButton", jb )
						submit:SetSize( 80, 30 )
						submit:SetPos( jb:GetWide() - 100, jb:GetTall() / 2 - 15 )
						submit:SetText( "" )
						submit.Paint = function(self, w, h)
							draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
							draw.DrawText( "Buy", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
						end
						submit.DoClick = function()
							RunConsoleCommand( "DarkRP", "buyammo", ammo.id )
							bg:Remove()
						end

						local model = vgui.Create( "DModelPanel", jb )
			    		model:SetSize( 60, 60 )
			    		model:SetPos( 0, 0 )
			    		model:SetModel( "models/Eli.mdl" )
			    		function model:LayoutEntity( Entity ) return end
						model:SetFOV( 10 )

						model:SetCamPos( Vector( 100, 200, 60 ) )
						model:SetLookAt( Vector(8,12,11) )
						model:SetModel(istable(ammo.model) and ammo.model[1] or ammo.model)
					end
				end
			end

			if sidebuttons[k].food == true then

				if IsValid(mainpanel) then
					mainpanel:Remove()
				end

				header.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.HeaderColor )

					surface.SetDrawColor( EZF4.HeaderTitleIconColor ) 
					surface.SetMaterial( headericon )
					surface.DrawTexturedRect( 20, 70 / 2 - 15, 30, 30 )

					draw.DrawText( "Food", "EZF4Titles", 55, 70 / 2 - 12.5, EZF4.HeaderTitleText, TEXT_ALIGN_LEFT )
				end

				mainpanel = vgui.Create( "DPanel", bg )
				mainpanel:SetPos( 220, 130 )
				mainpanel:SetSize( bg:GetWide() - 240, bg:GetTall() - 150 )
				mainpanel.Paint = function(self, w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ItemBackground )
				end

				local mainpanelscroll = vgui.Create( "DScrollPanel", mainpanel )
				mainpanelscroll:SetPos( 0, 0 )
				mainpanelscroll:SetSize( mainpanel:GetWide(), mainpanel:GetTall() )

				local sbar = mainpanelscroll:GetVBar()
				function sbar:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
				end
				function sbar.btnUp:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnDown:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnGrip:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBar )
				end

				for ind, food in pairs(FoodItems) do
					local jb = vgui.Create( "DPanel", mainpanelscroll )
			    	jb:Dock(TOP)
		    		jb:DockMargin(0, 0, 0, 0)
		    		jb:SetSize( mainpanelscroll:GetWide(), 60 )
		    		jb:SetText("")
		    		jb.Paint = function(self, w, h)
				    	draw.RoundedBox( 0, 0, h - 1, w, 1, EZF4.SeperationBars )
				    	draw.RoundedBox( 0, 0, 0, w, 1, EZF4.SeperationBars )
				    	draw.DrawText( food.name, "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
				    	draw.DrawText( "Price: " .. DarkRP.formatMoney( food.price ), "EZF4Categories", 65, 33, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )
					end

					local submit = vgui.Create( "DButton", jb )
					submit:SetSize( 80, 30 )
					submit:SetPos( jb:GetWide() - 100, jb:GetTall() / 2 - 15 )
					submit:SetText( "" )
					submit.Paint = function(self, w, h)
						draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
						draw.DrawText( "Buy", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
					end
					submit.DoClick = function()
						RunConsoleCommand( "DarkRP", "buyfood", food.name )
						bg:Remove()
					end

					local model = vgui.Create( "DModelPanel", jb )
		    		model:SetSize( 60, 60 )
		    		model:SetPos( 0, 0 )
		    		model:SetModel( "models/Eli.mdl" )
		    		function model:LayoutEntity( Entity ) return end
					model:SetFOV( 10 )

					model:SetCamPos( Vector( 100, 200, 60 ) )
					model:SetLookAt( Vector(8,12,11) )
					model:SetModel(istable(food.model) and food.model[1] or food.model)
				end
			end

			if sidebuttons[k].vehicles == true then

				if IsValid(mainpanel) then
					mainpanel:Remove()
				end

				header.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.HeaderColor )

					surface.SetDrawColor( EZF4.HeaderTitleIconColor ) 
					surface.SetMaterial( headericon )
					surface.DrawTexturedRect( 20, 70 / 2 - 15, 30, 30 )

					draw.DrawText( "Vehicles", "EZF4Titles", 55, 70 / 2 - 12.5, EZF4.HeaderTitleText, TEXT_ALIGN_LEFT )
				end

				mainpanel = vgui.Create( "DPanel", bg )
				mainpanel:SetPos( 220, 130 )
				mainpanel:SetSize( bg:GetWide() - 240, bg:GetTall() - 150 )
				mainpanel.Paint = function(self, w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ItemBackground )
				end

				local mainpanelscroll = vgui.Create( "DScrollPanel", mainpanel )
				mainpanelscroll:SetPos( 0, 0 )
				mainpanelscroll:SetSize( mainpanel:GetWide(), mainpanel:GetTall() )

				local sbar = mainpanelscroll:GetVBar()
				function sbar:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
				end
				function sbar.btnUp:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnDown:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBarButtons )
				end
				function sbar.btnGrip:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.ScrollBar )
				end

				local function lastcategoryisit(ar, ind)
					return next(ar, ind) == nil
				end

				local categories = DarkRP.getCategories().vehicles

				for ind, category in pairs(categories) do
					local categorychildren = category.members
	    			if not categorychildren or #categorychildren == 0 then continue end

	    			local mainCategories = vgui.Create("DCollapsibleCategory", mainpanelscroll)
					mainCategories:Dock(TOP)
		    		mainCategories:DockMargin(0, 0, 0, 0)
				    mainCategories:SetExpanded(1)
				    mainCategories.Header:SetTall(40)
			    	mainCategories:SetLabel("")
				    mainCategories.Paint = function(self, w, h)
				    	draw.RoundedBox( 0, 0, h - 1, w, 1, EZF4.SeperationBars )
				    	draw.DrawText( category.name, "EZF4Cats", 7, 20 - 15, EZF4.CategoryTitle, TEXT_ALIGN_LEFT )
					end

					for ind, vehicle in pairs(categorychildren) do
						local lastjobinlist = lastcategoryisit(categorychildren, ind)

						local jb = vgui.Create( "DPanel", mainCategories )
				    	jb:Dock(TOP)
			    		jb:DockMargin(0, 0, 0, 0)
			    		jb:SetSize( mainpanelscroll:GetWide(), 60 )
			    		jb:SetText("")
			    		jb.Paint = function(self, w, h)
					    	draw.RoundedBox( 0, 0, 0, w, 1, EZF4.SeperationBars )
					    	draw.DrawText( vehicle.name, "EZF4Categories", 65, 13, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )
					    	draw.DrawText( "Price: " .. DarkRP.formatMoney( vehicle.price ), "EZF4Categories", 65, 33, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )
						end

						local submit = vgui.Create( "DButton", jb )
						submit:SetSize( 80, 30 )
						submit:SetPos( jb:GetWide() - 100, jb:GetTall() / 2 - 15 )
						submit:SetText( "" )
						submit.Paint = function(self, w, h)
							draw.RoundedBox( 6, 0, 0, w, h, EZF4.ItemButtonsColor )
							draw.DrawText( "Buy", "EZF4ButtonNames", w / 2, h / 2 - 7.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
						end
						submit.DoClick = function()
							RunConsoleCommand( "DarkRP", "buyvehicle", vehicle.name )
							bg:Remove()
						end

						local model = vgui.Create( "DModelPanel", jb )
			    		model:SetSize( 60, 60 )
			    		model:SetPos( 0, 0 )
			    		model:SetModel( "models/Eli.mdl" )
			    		function model:LayoutEntity( Entity ) return end
						model:SetFOV( 10 )

						model:SetCamPos( Vector( 100, 200, 60 ) )
						model:SetLookAt( Vector(8,12,11) )
						model:SetModel(istable(vehicle.model) and vehicle.model[1] or vehicle.model)
					end
				end
			end

			if sidebuttons[k].dashboard == true then
				if IsValid(mainpanel) then
					mainpanel:Remove()
				end

				header.Paint = function(self, w, h)
					draw.RoundedBox( 0, 0, 0, w, h, EZF4.HeaderColor )

					surface.SetDrawColor( EZF4.HeaderTitleIconColor ) 
					surface.SetMaterial( headericon )
					surface.DrawTexturedRect( 20, 70 / 2 - 15, 30, 30 )

					draw.DrawText( "Commands", "EZF4Titles", 55, 70 / 2 - 12.5, EZF4.HeaderTitleText, TEXT_ALIGN_LEFT )
				end

				mainpanel = vgui.Create( "DPanel", bg )
				mainpanel:SetPos( 220, 130 )
				mainpanel:SetSize( bg:GetWide() - 240, bg:GetTall() - 150 )
				mainpanel.Paint = function(self, w, h )
					draw.RoundedBox( 0, 0, 0, w / 2 - 20, h, EZF4.ItemBackground )
					draw.RoundedBox( 0, w / 2 + 20, 0, w / 2 - 20, h, EZF4.ItemBackground )
					draw.RoundedBox( 0, 20, 40, w / 2 - 60, 2, EZF4.SeperationBars )
					draw.DrawText( "STAFF ONLINE", "EZF4Categories", 20, 13, EZF4.CategoryTitle )
				end

				local commandscroll = vgui.Create( "DScrollPanel", mainpanel )
				commandscroll:SetPos( mainpanel:GetWide() / 2, 20 )
				commandscroll:SetSize( mainpanel:GetWide() / 2 - 20, mainpanel:GetTall() - 20 )

				local sbar = commandscroll:GetVBar()
				function sbar:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
				end
				function sbar.btnUp:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) )
				end
				function sbar.btnDown:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) )
				end
				function sbar.btnGrip:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 100, 200, 0, 0 ) )
				end

				local mainplayersscroll = vgui.Create( "DScrollPanel", mainpanel )
				mainplayersscroll:SetPos( 20, 60 )
				mainplayersscroll:SetSize( mainpanel:GetWide() / 2 - 20, mainpanel:GetTall() - 60 )

				local sbar = mainplayersscroll:GetVBar()
				function sbar:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
				end
				function sbar.btnUp:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) )
				end
				function sbar.btnDown:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) )
				end
				function sbar.btnGrip:Paint( w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 100, 200, 0, 0 ) )
				end

				local y_pos = 0

				for k, v in pairs(player.GetAll()) do
					if table.HasValue( EZF4.Admins, v:GetUserGroup() ) then
						local ppp = vgui.Create( "DPanel", mainplayersscroll )
						ppp:SetPos( 0, 65 * y_pos )
						ppp:SetSize( mainplayersscroll:GetWide() - 40, 60 )
						ppp.Paint = function(self, w, h)
							draw.DrawText( v:Name(), "EZF4Categories", 65, 10, EZF4.ItemNameColor, TEXT_ALIGN_LEFT )

							rank = string.upper(v:GetUserGroup())

							draw.DrawText( rank, "EZF4Categories", 65, 30, EZF4.PriceSalaryTextColor, TEXT_ALIGN_LEFT )

							draw.RoundedBox( 0, 0, h - 2, w, 2, EZF4.SeperationBars )
						end

						local Avatar = vgui.Create( "AvatarImage", ppp )
						Avatar:SetSize( 60, 60 )
						Avatar:SetPos( 0, 0 )
						Avatar:SetPlayer( v, 60 )

						y_pos = y_pos + 1
					end
				end

				local commandbutton = {

					{

						name = "Drop Money",
						dropmoney = true

					},

					{

						name = "Drop Weapon",
						dropweapon = true

					},

					{

						name = "Change Name",
						changename = true

					},

					{

						name = "Change Job",
						changejob = true

					},

					{

						name = "Sleep/Wake Up",
						sleep = true

					},

					{

						name = "Request License",
						requestlicense = true

					},

					{

						name = "Advertise",
						advertise = true

					},

					{

						name = "Wanted",
						wanted = true

					},

					{

						name = "Warrant",
						warrant = true

					},

					{

						name = "Lockdown",
						lockdown = true

					},

				}

				for k, v in pairs(commandbutton) do
					local commandbuttons = vgui.Create( "DButton", commandscroll )
					commandbuttons:SetSize( commandscroll:GetWide() - 40, 40 )
					commandbuttons:SetPos( 40, 50 * (k-1) )
					commandbuttons:SetText( "" )
					commandbuttons.Paint = function(self, w, h)
						draw.RoundedBox( 0, 0, 0, w, h, EZF4.ItemButtonsColor )
						draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, h / 2 - 12.5, EZF4.ItemButtonText, TEXT_ALIGN_CENTER )
					end
					commandbuttons.DoClick = function()
						if commandbutton[k].dropmoney == true then
							local cbg = vgui.Create( "DFrame" )
							cbg:SetSize( 300, 150 )
							cbg:Center()
							cbg:SetTitle( "" )
							cbg:SetDraggable(true)
							cbg:ShowCloseButton(false)
							cbg:MakePopup()
							cbg.Paint = function(self, w, h)
								draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
								draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
								draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
								draw.DrawText( "HOW MUCH?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
							end

							local ctext = vgui.Create( "DTextEntry", cbg )
							ctext:SetSize( cbg:GetWide() / 2, 30 )
							ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
							ctext:SetText( "" )
							ctext.OnEnter = function()
								LocalPlayer():ConCommand( "darkrp dropmoney " .. ctext:GetValue() ) 
								if IsValid(cbg) then
									cbg:Remove()
								end
								if IsValid(bg) then
									bg:Remove()
								end
							end

							local cclose = vgui.Create( "DButton", cbg )
							cclose:SetSize( 20, 20 )
							cclose:SetPos( cbg:GetWide() - 30, 8 )
							cclose:SetText( "" )
							cclose.DoClick = function()
								if IsValid(cbg) then
									cbg:Remove()
								end
							end
							cclose.Paint = function(self, w, h)
								surface.SetDrawColor( EZF4.TopRightIconColor ) 
								surface.SetMaterial( toprighticon )
								surface.DrawTexturedRect( 0, 0, 20, 20 )
							end
						end

						if commandbutton[k].dropweapon == true then
							LocalPlayer():ConCommand( "darkrp dropweapon" )
							if IsValid(bg) then
								bg:Remove()
							end
						end

						if commandbutton[k].changename == true then
							local cbg = vgui.Create( "DFrame" )
							cbg:SetSize( 300, 150 )
							cbg:Center()
							cbg:SetTitle( "" )
							cbg:SetDraggable(true)
							cbg:ShowCloseButton(false)
							cbg:MakePopup()
							cbg.Paint = function(self, w, h)
								draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
								draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
								draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
								draw.DrawText( "CHANGE TOO?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
							end

							local ctext = vgui.Create( "DTextEntry", cbg )
							ctext:SetSize( cbg:GetWide() / 2, 30 )
							ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
							ctext:SetText( "" )
							ctext.OnEnter = function()
								LocalPlayer():ConCommand( "darkrp rpname " .. ctext:GetValue() ) 
								if IsValid(cbg) then
									cbg:Remove()
								end
								if IsValid(bg) then
									bg:Remove()
								end
							end

							local cclose = vgui.Create( "DButton", cbg )
							cclose:SetSize( 20, 20 )
							cclose:SetPos( cbg:GetWide() - 30, 8 )
							cclose:SetText( "" )
							cclose.DoClick = function()
								if IsValid(cbg) then
									cbg:Remove()
								end
							end
							cclose.Paint = function(self, w, h)
								surface.SetDrawColor( EZF4.TopRightIconColor ) 
								surface.SetMaterial( toprighticon )
								surface.DrawTexturedRect( 0, 0, 20, 20 )
							end
						end

						if commandbutton[k].changejob == true then
							local cbg = vgui.Create( "DFrame" )
							cbg:SetSize( 300, 150 )
							cbg:Center()
							cbg:SetTitle( "" )
							cbg:SetDraggable(true)
							cbg:ShowCloseButton(false)
							cbg:MakePopup()
							cbg.Paint = function(self, w, h)
								draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
								draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
								draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
								draw.DrawText( "CHANGE TOO?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
							end

							local ctext = vgui.Create( "DTextEntry", cbg )
							ctext:SetSize( cbg:GetWide() / 2, 30 )
							ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
							ctext:SetText( "" )
							ctext.OnEnter = function()
								LocalPlayer():ConCommand( "darkrp job " .. ctext:GetValue() ) 
								if IsValid(cbg) then
									cbg:Remove()
								end
								if IsValid(bg) then
									bg:Remove()
								end
							end

							local cclose = vgui.Create( "DButton", cbg )
							cclose:SetSize( 20, 20 )
							cclose:SetPos( cbg:GetWide() - 30, 8 )
							cclose:SetText( "" )
							cclose.DoClick = function()
								if IsValid(cbg) then
									cbg:Remove()
								end
							end
							cclose.Paint = function(self, w, h)
								surface.SetDrawColor( EZF4.TopRightIconColor ) 
								surface.SetMaterial( toprighticon )
								surface.DrawTexturedRect( 0, 0, 20, 20 )
							end
						end

						if commandbutton[k].sleep == true then
							LocalPlayer():ConCommand( "darkrp sleep" )
							if IsValid(bg) then
								bg:Remove()
							end
						end

						if commandbutton[k].requestlicense == true then
							LocalPlayer():ConCommand( "darkrp requestlicense" )
							if IsValid(bg) then
								bg:Remove()
							end
						end

						if commandbutton[k].advertise == true then
							local cbg = vgui.Create( "DFrame" )
							cbg:SetSize( 300, 150 )
							cbg:Center()
							cbg:SetTitle( "" )
							cbg:SetDraggable(true)
							cbg:ShowCloseButton(false)
							cbg:MakePopup()
							cbg.Paint = function(self, w, h)
								draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
								draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
								draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
								draw.DrawText( "ADVERT WHAT?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
							end

							local ctext = vgui.Create( "DTextEntry", cbg )
							ctext:SetSize( cbg:GetWide() / 2, 30 )
							ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
							ctext:SetText( "" )
							ctext.OnEnter = function()
								LocalPlayer():ConCommand( "say /advert " .. ctext:GetValue() ) 
								if IsValid(cbg) then
									cbg:Remove()
								end
								if IsValid(bg) then
									bg:Remove()
								end
							end

							local cclose = vgui.Create( "DButton", cbg )
							cclose:SetSize( 20, 20 )
							cclose:SetPos( cbg:GetWide() - 30, 8 )
							cclose:SetText( "" )
							cclose.DoClick = function()
								if IsValid(cbg) then
									cbg:Remove()
								end
							end
							cclose.Paint = function(self, w, h)
								surface.SetDrawColor( EZF4.TopRightIconColor ) 
								surface.SetMaterial( toprighticon )
								surface.DrawTexturedRect( 0, 0, 20, 20 )
							end
						end

						if commandbutton[k].wanted == true then
							local cbg = vgui.Create( "DFrame" )
							cbg:SetSize( 300, 150 )
							cbg:Center()
							cbg:SetTitle( "" )
							cbg:SetDraggable(true)
							cbg:ShowCloseButton(false)
							cbg:MakePopup()
							cbg.Paint = function(self, w, h)
								draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
								draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
								draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
								draw.DrawText( "WANT WHO?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
							end

							local ctext = vgui.Create( "DComboBox", cbg )
							ctext:SetSize( cbg:GetWide() / 2, 30 )
							ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
							ctext:SetText( "" )
							ctext:SetValue( "Players" )

							for k, v in pairs(player.GetAll()) do
								ctext:AddChoice( v:Name() )
							end

							ctext.OnSelect = function( panel, index, value )
								cbg.Paint = function(self, w, h)
									draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
									draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
									draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
									draw.DrawText( "WANTED REASON?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
								end

								local ctext = vgui.Create( "DTextEntry", cbg )
								ctext:SetSize( cbg:GetWide() / 2, 30 )
								ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
								ctext:SetText( "" )
								ctext.OnEnter = function()
									LocalPlayer():ConCommand( "darkrp wanted " .. value .. ctext:GetValue() ) 
									if IsValid(cbg) then
										cbg:Remove()
									end
									if IsValid(bg) then
										bg:Remove()
									end
								end
							end

							local cclose = vgui.Create( "DButton", cbg )
							cclose:SetSize( 20, 20 )
							cclose:SetPos( cbg:GetWide() - 30, 8 )
							cclose:SetText( "" )
							cclose.DoClick = function()
								if IsValid(cbg) then
									cbg:Remove()
								end
							end
							cclose.Paint = function(self, w, h)
								surface.SetDrawColor( EZF4.TopRightIconColor ) 
								surface.SetMaterial( toprighticon )
								surface.DrawTexturedRect( 0, 0, 20, 20 )
							end
						end

						if commandbutton[k].warrant == true then
							local cbg = vgui.Create( "DFrame" )
							cbg:SetSize( 300, 150 )
							cbg:Center()
							cbg:SetTitle( "" )
							cbg:SetDraggable(true)
							cbg:ShowCloseButton(false)
							cbg:MakePopup()
							cbg.Paint = function(self, w, h)
								draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
								draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
								draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
								draw.DrawText( "WARRANT WHO?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
							end

							local ctext = vgui.Create( "DComboBox", cbg )
							ctext:SetSize( cbg:GetWide() / 2, 30 )
							ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
							ctext:SetText( "" )
							ctext:SetValue( "Players" )

							for k, v in pairs(player.GetAll()) do
								ctext:AddChoice( v:Name() )
							end

							ctext.OnSelect = function( panel, index, value )
								cbg.Paint = function(self, w, h)
									draw.RoundedBox( 0, 0, 0, w, h, EZF4.MainBackground )
									draw.RoundedBox( 0, 0, 0, w, 35, EZF4.SideBarColor )
									draw.DrawText( commandbutton[k].name, "EZF4Titles", w / 2, 5, EZF4.ButtonTextColorHover, TEXT_ALIGN_CENTER )
									draw.DrawText( "WARRANT REASON?", "EZF4Titles", w / 2, 55, EZF4.CommandInfo, TEXT_ALIGN_CENTER )
								end

								local ctext = vgui.Create( "DTextEntry", cbg )
								ctext:SetSize( cbg:GetWide() / 2, 30 )
								ctext:SetPos( cbg:GetWide() / 2 - ctext:GetWide() / 2, cbg:GetTall() - 50 )
								ctext:SetText( "" )
								ctext.OnEnter = function()
									LocalPlayer():ConCommand( "darkrp warrant " .. value .. ctext:GetValue() ) 
									if IsValid(cbg) then
										cbg:Remove()
									end
									if IsValid(bg) then
										bg:Remove()
									end
								end
							end

							local cclose = vgui.Create( "DButton", cbg )
							cclose:SetSize( 20, 20 )
							cclose:SetPos( cbg:GetWide() - 30, 8 )
							cclose:SetText( "" )
							cclose.DoClick = function()
								if IsValid(cbg) then
									cbg:Remove()
								end
							end
							cclose.Paint = function(self, w, h)
								surface.SetDrawColor( EZF4.TopRightIconColor ) 
								surface.SetMaterial( toprighticon )
								surface.DrawTexturedRect( 0, 0, 20, 20 )
							end
						end

						if commandbutton[k].lockdown == true then
							LocalPlayer():ConCommand( "darkrp lockdown" )
							if IsValid(bg) then
								bg:Remove()
							end
						end
					end
				end
			end

			if sidebuttons[k].website == true then
				gui.OpenURL( sidebuttons[k].site )
			end
		end
	end

	timer.Simple(0, function()
	    function DarkRP.openF4Menu()
	        ezf4menu()
	    end

	    function DarkRP.closeF4Menu()
	        if IsValid(bg) then 
	        	bg:Remove()
	        end
	    end

	    function DarkRP.toggleF4Menu()
	        DarkRP[
	        	( IsValid(bg) && "close" || "open" ).."F4Menu"
	        ]()
	    end

	    GAMEMODE.ShowSpare2 = DarkRP.toggleF4Menu
	end)

end

surface.CreateFont( "EZF4ButtonNames", {
	font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 15,
	weight = 600,
	antialias = true,
})

surface.CreateFont( "EZF4Categories", {
	font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	weight = 500,
	antialias = true,
})

surface.CreateFont( "EZF4Cats", {
	font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 400,
	antialias = true,
})

surface.CreateFont( "EZF4Titles", {
	font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 25,
	weight = 500,
	antialias = true,
})

surface.CreateFont( "EZF4Name", {
	font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 40,
	weight = 500,
	antialias = true,
})

surface.CreateFont( "EZF4Info", {
	font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	weight = 500,
	antialias = true,
})