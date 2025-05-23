local Translations = {
    error = {
        ['already_mission'] = 'Bạn đang thực hiện một nhiệm vụ taxi khác',
        ['not_in_taxi'] = 'Bạn không đang ở trong xe taxi',
        ['missing_meter'] = 'Xe này không có đồng hồ tính cước',
        ['no_vehicle'] = 'Bạn không đang ở trong xe',
        ['not_active_meter'] = 'Đồng hồ tính cước chưa được bật',
        ['ride_canceled'] = 'Bạn đã va chạm quá nhiều, chuyến đi bị hủy!',
        ['broken_taxi'] = 'Taxi của bạn cần được sửa chữa trước khi tiếp tục công việc!',
        ['crash_warning'] = 'Nếu bạn va chạm thêm %d lần %s nữa, khách hàng sẽ hủy chuyến đi và bạn sẽ không được trả tiền!',
        ['time'] = 'lần',
        ['times'] = 'lần',
    },
    success = {
        ['mission_cancelled'] = 'Đã hủy nhiệm vụ thành công',
    },
    info = {
        ['person_was_dropped_off'] = 'Đã đưa khách đến nơi!',
        ['npc_on_gps'] = 'Vị trí khách hàng đã hiển thị trên GPS',
        ['go_to_location'] = 'Đưa khách đến địa điểm được chỉ định',
        ['vehicle_parking'] = '[E] Đỗ xe',
        ['job_vehicles'] = '[E] Xe công việc',
        ['drop_off_npc'] = '[E] Thả khách',
        ['call_npc'] = '[E] Gọi khách',
        ['blip_name'] = 'Taxi Trung Tâm',
        ['taxi_label_1'] = 'Taxi Thường',
        ['no_spawn_point'] = 'Không thể tìm được vị trí để gọi taxi',
        ['taxi_returned'] = 'Đã trả xe',
        ['on_duty'] = '[E] - Bắt đầu làm việc',
        ['off_duty'] = '[E] - Kết thúc ca làm',
        ['tip_received'] = 'Bạn đã được thưởng $%d vì lái xe an toàn',
        ['tip_not_received'] = 'Hãy cố gắng không gây tai nạn nếu bạn muốn được thưởng lần sau',
    },
    menu = {
        ['taxi_menu_header'] = 'Danh sách xe taxi',
        ['close_menu'] = '⬅ Đóng menu',
        ['boss_menu'] = 'Menu Quản Lý'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
