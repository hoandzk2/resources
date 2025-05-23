Config = Config or {}

Config.Toggle = true
Config.OpenKey = 'HOME'
Config.ShowIDforALL = false
Config.MaxPlayers = GetConvarInt('sv_maxclients', 48)

Config.IllegalActions = {
    ['storerobbery'] = {
        minimumPolice = 1,
        busy = false,
        label = 'Cướp Cửa Hàng',
    },
    ['bankrobbery'] = {
        minimumPolice = 3,
        busy = false,
        label = 'Cướp Ngân Hàng'
    },
    ['jewellery'] = {
        minimumPolice = 2,
        busy = false,
        label = 'Cướp Trang Sức'
    },
    ['pacific'] = {
        minimumPolice = 5,
        busy = false,
        label = 'Cướp Ngân Hàng Trung Tâm'
    },
    ['paleto'] = {
        minimumPolice = 4,
        busy = false,
        label = 'Cướp Ngân Hàng 3h'
    }
}
