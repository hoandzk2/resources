local Translations = {
    error = {
        no_vehicles = 'Không có phương tiện nào ở vị trí này!',
        not_depot = 'Phương tiện của bạn không ở bãi giữ xe',
        not_owned = 'Bạn không thể cất giữ phương tiện không thuộc sở hữu của mình',
        not_correct_type = 'Bạn không thể cất loại phương tiện này ở đây',
        not_enough = 'Không đủ tiền',
        no_garage = 'Không có',
        vehicle_occupied = 'Bạn không thể cất phương tiện này vì nó chưa trống',
        vehicle_not_tracked = 'Không thể theo dõi phương tiện',
        no_spawn = 'Khu vực quá đông'
    },
    success = {
        vehicle_parked = 'Phương tiện đã được cất giữ',
        vehicle_tracked = 'Phương tiện đã được theo dõi',
    },
    status = {
        out = 'Đang sử dụng',
        garaged = 'Đã cất trong garage',
        impound = 'Bị cảnh sát tạm giữ',
        house = 'Nhà',
    },
    info = {
        car_e = 'E - Garage',
        sea_e = 'E - Bến thuyền',
        air_e = 'E - Nhà chứa máy bay',
        rig_e = 'E - Bãi giữ xe giàn khoan',
        depot_e = 'E - Bãi giữ xe',
        house_garage = 'E - Garage tại nhà',
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})