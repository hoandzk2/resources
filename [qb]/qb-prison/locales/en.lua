local Translations = {
    error = {
        ["missing_something"] = "Có vẻ như bạn đang thiếu gì đó...",
        ["not_enough_police"] = "Không đủ cảnh sát..",
        ["door_open"] = "Cửa đã mở rồi..",
        ["cancelled"] = "Đã hủy quá trình..",
        ["didnt_work"] = "Không thành công..",
        ["emty_box"] = "Chiếc hộp rỗng..",
        ["injail"] = "Bạn bị giam %{Time} tháng..",
        ["item_missing"] = "Bạn đang thiếu một vật phẩm..",
        ["escaped"] = "Bạn đã trốn thoát... Mau chạy đi.!",
        ["do_some_work"] = "Làm vài công việc để giảm án, công việc hiện tại: %{currentjob}",
        ["security_activated"] = "Mức an ninh cao nhất đã được kích hoạt, hãy ở lại khu giam giữ!"
    },
    success = {
        ["found_phone"] = "Bạn đã tìm thấy một chiếc điện thoại..",
        ["time_cut"] = "Bạn đã làm việc để giảm án phạt.",
        ["free_"] = "Bạn được tự do rồi! Hãy tận hưởng! :)",
        ["timesup"] = "Đã đến lúc mãn hạn tù! Hãy đến quầy tiếp tân để ra trại"
    },
    info = {
        ["timeleft"] = "Bạn vẫn còn... %{JAILTIME} tháng",
        ["lost_job"] = "Bạn đã mất việc",
        ["job_interaction"] = "[E] Sửa điện",
        ["job_interaction_target"] = "Làm công việc %{job}",
        ["received_property"] = "Bạn đã nhận lại tài sản của mình..",
        ["seized_property"] = "Tài sản của bạn đã bị tịch thu, bạn sẽ nhận lại khi mãn hạn tù..",
        ["cells_blip"] = "Phòng giam",
        ["freedom_blip"] = "Quầy tiếp tân nhà tù",
        ["canteen_blip"] = "Nhà ăn",
        ["work_blip"] = "Khu lao động",
        ["target_freedom_option"] = "Kiểm tra thời gian còn lại",
        ["target_canteen_option"] = "Lấy đồ ăn",
        ["police_alert_title"] = "Cuộc gọi mới",
        ["police_alert_description"] = "Vượt ngục tại nhà tù",
        ["connecting_device"] = "Đang kết nối thiết bị",
        ["working_electricity"] = "Đang nối dây điện"
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
