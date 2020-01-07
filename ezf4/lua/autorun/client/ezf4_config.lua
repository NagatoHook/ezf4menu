EZF4 = {}

// F4 Menu Tabs

	EZF4.Admins = { "superadmin", "admin", "founder", "moderator" } -- Admin ranks for the staff online.

	EZF4.DisableCurrentJob = true -- False if you want the players current job to show up in F4 Menu, true to make it get deleted when player is the job.

	EZF4.HideItems = true -- Whether or not to show the weapons to the job that can only buy them, e.g. if true then the weapons will only show to job allowed to buy them.

	-- To enable the Food/Vehicles remove the //'s
	-- To remove a tab add //'s to it

	EZF4.Tabs = {

		{

			name = "DASHBOARD",
			dashboard = true

		},

		{

			name = "JOBS",
			jobs = true

		},

		{

			name = "WEAPONS",
			weapons = true

		},

		{

			name = "SHIPMENTS",
			shipments = true

		},

		{

			name = "ENTITIES",
			entities = true

		},

		{

			name = "AMMO",
			ammo = true

		},

		//{

		//	name = "FOOD",
		//	food = true

		//},

		//{

		//	name = "VEHICLES",
		//	vehicles = true

		//},

		{

			name = "WEBSITE",
			website = true,
			site = "https://www.aeonian-networks.co.uk"

		},

	}


// F4 Menu Colors
 
EZF4.MainBackground = Color( 56, 66, 72 ) -- Main background color of the F4 Menu

EZF4.SideBarColor = Color( 38, 50, 56 ) -- Side bar color with the job/entities/etc... buttons

EZF4.TopInfoBG = Color( 63, 81, 181 ) -- The info background with your avatar, name and job.
EZF4.TopInfoText = Color( 255, 255, 255 ) -- The info text color.

EZF4.ButtonTextColor = Color( 131, 134, 143 ) -- The text color of entities/jobs/shipments when unhovered.
EZF4.ButtonTextColorHover = Color( 255, 255, 255 ) -- Text color of entities/jobs/shipments when hovered.

EZF4.TopLeftIconColor = Color( 29, 233, 182, 255 ) -- Color of the top left icon.
EZF4.TopRightIconColor = Color( 29, 233, 182, 255 ) -- Color of the top right icon.

EZF4.HeaderColor = Color( 38, 50, 56 ) -- Color of the header where it says the category names.
EZF4.HeaderTitleText = Color( 255, 255, 255, 255 ) -- Color of the section text on the header.
EZF4.HeaderTitleIconColor = Color( 29, 233, 182, 255 ) -- Color of the icon on the header.

EZF4.ItemBackground = Color( 38, 50, 56, 255 ) -- Color of the main background where jobs/entities/etc... appear
EZF4.SeperationBars = Color( 29, 234, 183, 255 ) -- The small lines seperating the items from one another.

EZF4.CategoryTitle = Color( 255, 255, 255 ) -- Color of the category titles

EZF4.ItemNameColor = Color( 255, 255, 255, 255 ) -- Color of the item name.
EZF4.PriceSalaryTextColor = Color( 29, 234, 183, 255 ) -- Color of the item salary/price.

EZF4.ItemButtonsColor = Color( 233, 83, 91 ) -- Color of the info/apply/buy button.
EZF4.ItemButtonText = Color( 255, 255, 255 ) -- Color of the info/apply/buy text.

-- Info Derma Config

EZF4.InfoBG = Color( 56, 66, 72, 255 ) -- Color of the info background.
EZF4.InfoColor = Color( 255, 255, 255, 255 ) -- Color of the info text, e.g description and weapons
EZF4.InfoBoxColor = Color( 233, 83, 91 ) -- Color of the title boxes, e.g description, weapons, close
EZF4.BoxTitleColor = Color( 255, 255, 255 ) -- Color of the titles boxes text

EZF4.CommandInfo = Color( 249, 72, 72 ) -- Color of the commands info.

EZF4.ScrollBarButtons = Color( 33, 150, 109 ) -- Scroll bar button colors
EZF4.ScrollBar = Color( 30, 187, 162 ) -- Scroll bar color.