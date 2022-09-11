|----------------------------------------------------------------------------------------------------------------------------|
|                                                                                                                            |  
|                                                                                                                            |
|                                                                                                                            |
|                                 Thank you for buying my script! Down below you will find a detailed read me                |
|                                 for how to install this script! If you have further questions reach out via                |
|                                 a ticket in discord!                                                                       |
|                                                                                                                            |
|                                                                                                                            |
|----------------------------------------------------------------------------------------------------------------------------|




1. Add to jobs in shared/jobs.lua or shared.lua

    ['trucker'] = {
        label = 'trucker',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Driver',
                payment = 650
            },
            ['1'] = {
                name = 'Supervisor',
                payment = 800
            },
            ['2'] = {
                name = 'Plant Manager',
                payment = 1500
            },
            ['3'] = {
                name = 'CEO',
                isboss = true,
                payment = 3500
            }
        }
    },
    ['warehouse'] = {
        label = 'warehouse',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Entry Level Warehouse',
                payment = 650
            },
            ['1'] = {
                name = 'Warehouse Inventory',
                payment = 800
            },
            ['2'] = {
                name = 'Driver',
                payment = 1500
            },
            ['3'] = {
                name = 'Boss',
                isboss = true,
                payment = 3500
            }
        }
    },

2. Install the images from the images folder into your inventory html/images folder

3. Set your job as trucker or warehouse and enjoy!