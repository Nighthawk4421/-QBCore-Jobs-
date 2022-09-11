1. Insert into items:

['whitewidow'] 		 			 = {['name'] = 'whitewidow', 					['label'] = 'whitewidow', 				['weight'] = 5, 		['type'] = 'item', 		['image'] = 'whitewidow.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'White widow crop '},
	['sourapplediesel'] 		 			 = {['name'] = 'sourapplediesel', 					['label'] = 'Sour Apple Diesel', 				['weight'] = 5, 		['type'] = 'item', 		['image'] = 'sourapplediesel.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Sour apple diesel '},
	['bluedream'] 		 			 = {['name'] = 'bluedream', 					['label'] = 'bluedream', 				['weight'] = 5, 		['type'] = 'item', 		['image'] = 'bluedream.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Blue Dream '},
	['ogkush'] 		 			 = {['name'] = 'ogkush', 					['label'] = 'ogkush', 				['weight'] = 5, 		['type'] = 'item', 		['image'] = 'ogkush.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'OG Kush '},
	['girlscoutcookies'] 		 			 = {['name'] = 'girlscoutcookies', 					['label'] = 'girlscoutcookies', 				['weight'] = 5, 		['type'] = 'item', 		['image'] = 'ogkush.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'GSC '},
	['girlscoutcookiesseed'] 		 			 = {['name'] = 'girlscoutcookiesseed', 					['label'] = 'girlscoutcookiesseed', 				['weight'] = 5, 		['type'] = 'item', 		['image'] = 'ogkush.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'GSC Seeds '},
	['hackingdevice'] 						 = {['name'] = 'hackingdevice', 			  	  		['label'] = 'Hacking Device', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'hackerdevice.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A hacking device'},
	
	['premiumbluedreamblunt'] 						 = {['name'] = 'premiumbluedreamblunt', 			  	  		['label'] = 'Blue Dream Blunt', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'joint.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Fat blue dream blunt'},
	['scale'] 						 = {['name'] = 'scale', 			  	  		['label'] = 'scale', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'scale.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A simple scale'},
	['grinder'] 						 = {['name'] = 'grinder', 			  	  		['label'] = 'grinder', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'grinder.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A simple grinder'},
	['trimmers'] 						 = {['name'] = 'trimmers', 			  	  		['label'] = 'trimmers', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'scissors.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Trimmers for weed '},
	['premiumogkushblunt'] 						 = {['name'] = 'premiumogkushblunt', 			  	  		['label'] = 'OG Kush Blunt', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'joint.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Fat og kush blunt'},
	['premiumsourappledieselblunt'] 						 = {['name'] = 'premiumsourappledieselblunt', 			  	  		['label'] = 'Sour Apple Diesel Blunt', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'joint.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Sour apple diesel blunt'},
	['premiumwhitewidowblunt'] 						 = {['name'] = 'premiumwhitewidowblunt', 			  	  		['label'] = 'White Widow Blunt', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'joint.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Fat ass white widow blunt'},
	['gscblunt'] 						 = {['name'] = 'gscblunt', 			  	  		['label'] = 'Girl Scout Cookies Blunt', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'joint.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Fat ass girl scout cookies blunt'},
	

    2. Install images in inventory

    3. Install job to shared/jobs.lua

    ['whitewidow'] = {
        label = 'whitewidow',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Employee ',
                payment = 650
            },
            ['1'] = {
                name = 'Sales Floor',
                payment = 800
            },
            ['2'] = {
                name = 'Manager',
                payment = 1500
            },
            ['3'] = {
                name = 'Boss',
                isboss = true,
                payment = 3500
            }
        }
    },

    4. Add to qb-management or whatever boss menu you use

    Config.BozzMenuZones = {
        ['whitewidow'] = {
            { coords = vector3(182.86, -251.68, 54.07), length = 1.15, width = 2.7, heading = 339.22, minZ = 1.30, maxZ = 300.30 },
    },
    }

    Config.BossMenus = {
        ['whitewidow'] = {
            vector3(182.86, -251.68, 54.07),
        },
    }