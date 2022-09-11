1. Thank you for buying my moonshine script! This was made solely by Nighthawk.

2. Install Necessary Items and Dependencies

Dependencies:

qb-target - BerkieB
qb-core
qb-inventory
progressbar

items:

["moonshinecase"] 				     = {["name"] = "moonshinecase", 			  	["label"] = "Case of Moonshine", 		["weight"] = 5, 		["type"] = "item", 		["image"] = "moonshinecase.png", 	    ["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = true,   ["description"] = "A case of moonshine"},
["moonshinejar"] 				     = {["name"] = "moonshinejar", 			  	    ["label"] = "Jar of Moonshine", 		["weight"] = 5, 		["type"] = "item", 		["image"] = "moonshinejar.png", 	    ["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = true,   ["description"] = "A jar of moonshine"},
["rubbingalcohol"] 				     = {["name"] = "rubbingalcohol", 			  	["label"] = "rubbing alcohol", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "rubbingalcohol.png", 	    ["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = true,   ["description"] = "Rubbing alcohol"},
["barley"] 				             = {["name"] = "barley", 			  	        ["label"] = "heap of barley", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "barley.png", 	            ["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = true,   ["description"] = "Barley"},
["butanegas"] 				         = {["name"] = "butanegas", 			  	    ["label"] = "heap of butanegas", 		["weight"] = 5, 		["type"] = "item", 		["image"] = "butanegas.png", 	        ["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = true,   ["description"] = "Butane gas"},
["oliveoil"] 				         = {["name"] = "oliveoil", 			  	        ["label"] = "heap of oliveoil", 		["weight"] = 5, 		["type"] = "item", 		["image"] = "oliveoil.png", 	        ["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = true,   ["description"] = "Olive Oil"},
["trimmers"] 				         = {["name"] = "trimmers", 			  	        ["label"] = "barley trimmers", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "trimmers.png", 	        ["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = true,   ["description"] = "Barley Trimmers"},
['deliveryreceipt'] 			 	 = {['name'] = 'deliveryreceipt', 			  		['label'] = 'Delivery Receipt', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'stickynote.png', 			['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Sometimes handy to remember something :)'},
['delivery_instructions'] 			 = {['name'] = 'delivery_instructions', 			  		['label'] = 'Delivery Instructions', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'stickynote.png', 			['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Sometimes handy to remember something :)'},


3. Install the following job into your jobs section of the qb-core shared file:
    qb-core/shared/jobs.lua
    or
    qb-core/shared.lua

    ['moonshiner'] = {
        label = 'Moonshiner',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Field Farmer',
                payment = 1500
            },
            ['1'] = {
                name = 'Cook & Packer',
                payment = 2000
            },
            ['2'] = {
                name = 'Transport',
                payment = 2500
            },
            ['3'] = {
                name = 'Boss',
                isboss = true,
                payment = 3500
            }
        }
    },


4. Add images provided to your inventory html/images folder:   qb-inventory, lj-inventory, aj-inventory, ox_inventory, etc.

5. Drag and Drop "moonshine" to your server resources folder. 

6. Start or ensure 'moonshine' in your server.cfg ( without quotations )

7. Enjoy! <3