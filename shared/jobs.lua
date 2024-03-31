---@class Job
---@field label string
---@field type? string
---@field defaultDuty boolean
---@field offDutyPay boolean
---@field grades table<integer, {name: string, payment: number, isboss: boolean, bankAuth: boolean}>

---@type table<string, Job>
return {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 100
            },
        },
	},
	['police'] = {
		label = 'SAST',
        type = 'leo',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 1250
            },
            ['1'] = {
                name = 'Trooper',
                payment = 1550
            },
			['2'] = {
                name = 'Senior Trooper',
                payment = 1750
            },
			['3'] = {
                name = 'Sergeant',
                isboss = true,
                payment = 2000
            },
			['4'] = {
                name = 'Lieutenant',
                isboss = true,
                payment = 2100
            },
			['5'] = {
                name = 'Captain',
				isboss = true,
                bankAuth = true,
                payment = 2400
            },
			['6'] = {
                name = 'Director',
				isboss = true,
                bankAuth = true,
                payment = 2700
            },
        },
	},
	['bcso'] = {
		label = 'BCSO',
        type = 'leo',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Officer',
                payment = 1500
            },
			['1'] = {
                name = 'Senior Officer',
                payment = 1650
            },
			['2'] = {
                name = 'Sergeant',
                isboss = true,
                payment = 1950
            },
			['3'] = {
                name = 'Lieutenant',
                isboss = true,
                payment = 2100
            },
			['4'] = {
                name = 'Captain',
				isboss = true,
                bankAuth = true,
                payment = 2400
            },
			['5'] = {
                name = 'Sheriff',
				isboss = true,
                bankAuth = true,
                payment = 2700
            },
        },
	},
	['ambulance'] = {
		label = 'EMS',
        type = 'ems',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Probationary',
                payment = 1000
            },
			['1'] = {
                name = 'Entry',
                payment = 1400
            },
			['2'] = {
                name = 'Established',
                payment = 1650
            },
			['3'] = {
                name = 'Supervisor',
                payment = 1800
            },
			['4'] = {
                name = 'Management',
                isboss = true,
                payment = 2000
            },
            ['5'] = {
                name = 'Director',
				isboss = true,
                bankAuth = true,
                payment = 2200
            },
            ['6'] = {
                name = 'Chief',
				isboss = true,
                bankAuth = true,
                payment = 2500
            },
        },
	},
    ['firefighter'] = {
        label = 'Firefighter',
        type = 'ems',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Probationary Firefighter',
                payment = 1000
            },
            ['1'] = {
                name = 'Firefighter',
                payment = 1250
            },
            ['2'] = {
                name = 'Driver/Engineer',
                payment = 1400
            },
            ['3'] = {
                name = 'Lieutenant',
                payment = 1700
            },
            ['4'] = {
                name = 'Captain',
                payment = 1800
            },
            ['5'] = {
                name = 'Assistant Chief',
                isboss = true,
                bankAuth = true,
                payment = 2000
            },
            ['6'] = {
                name = 'Chief',
                isboss = true,
                bankAuth = true,
                payment = 2200
            },
        },
    },
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 100
            },
			['3'] = {
                name = 'Sales',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
	},
	['cardealer'] = {
		label = 'PDM Vehicle Dealer',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
	},
    ['boatdealer'] = {
		label = 'Boat Dealer',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
	},
    ['68customs'] = {
		label = '68 Customs',
        type = 'mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1500 
            },
			['1'] = {
                name = 'Employee',
                payment = 2000 
            },
			['2'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 2500
            },
        },
	},
    ['lsc'] = {
		label = 'Los Santos Customs',
        type = 'mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1500 
            },
			['1'] = {
                name = 'Employee',
                payment = 2000 
            },
			['2'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 2500
            },
        },
	},
    ['esautos'] = {
		label = 'East Side Autos',
        type = 'mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1500 
            },
			['1'] = {
                name = 'Employee',
                payment = 2000 
            },
			['2'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 2500
            },
        },
	},
    ['tuner'] = {
		label = 'Tuner',
        type = 'mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1500 
            },
			['1'] = {
                name = 'Employee',
                payment = 2000 
            },
			['2'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 2500
            },
        },
	},
    ['beekers'] = {
		label = 'Beekers Garage',
        type = 'mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1500 
            },
			['1'] = {
                name = 'Employee',
                payment = 2000 
            },
			['2'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 2500
            },
        },
	},
    ['flyingaces'] = {
		label = "Ace's Aviation",
        type = 'mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1500 
            },
			['1'] = {
                name = 'Employee',
                payment = 2000 
            },
			['2'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 2500
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
        type = 'mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1500 
            },
			['1'] = {
                name = 'Employee',
                payment = 2000 
            },
			['2'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 2500
            },
        },
	},
	['doj'] = {
		label = 'Department of Justice',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Lawyer',
                payment = 1500,
            },
            ['1'] = {
                name = 'Associate',
                payment = 2000,
                bankAuth = true,
            },
            ['2'] = {
                name = 'Judge',
                payment = 2800,
				isboss = true,
                bankAuth = true,
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 50
            },
            ['1'] = {
                name = 'Manager',
                payment = 150,
                isboss = true,
                bankAuth = true,
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
    ['wine'] = {
        label = 'Winemaker',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Vineyard Worker',
                payment = 50
            },
            ['1'] = {
                name = 'Vineyard Boss',
				isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
}
