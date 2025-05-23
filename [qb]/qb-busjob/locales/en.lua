local Translations = {
    error = {
        already_driving_bus = 'Bạn đang lái xe buýt rồi',
        not_in_bus = 'Bạn không ở trên xe buýt',
        one_bus_active = 'Bạn chỉ có thể kích hoạt một xe buýt tại một thời điểm',
        drop_off_passengers = 'Hãy thả hành khách xuống trước khi kết thúc công việc',
        exploit = "Phát hiện hành vi gian lận"
    },
    success = {
        dropped_off = 'Đã thả hành khách',
    },
    info = {
        bus = 'Xe buýt tiêu chuẩn',
        goto_busstop = 'Đi đến trạm xe buýt',
        busstop_text = '[E] Trạm xe buýt',
        bus_plate = 'BUS', -- Có thể gồm 3 hoặc 4 ký tự (kèm 4 số ngẫu nhiên)
        bus_depot = 'Bến xe buýt',
        bus_stop_work = '[E] Ngừng làm việc',
        bus_job_vehicles = '[E] Xe làm việc'
    },
    menu = {
        bus_header = 'Danh sách xe buýt',
        bus_close = '⬅ Đóng menu'
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
