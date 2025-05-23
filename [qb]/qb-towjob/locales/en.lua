local Translations = {
    error = {
        finish_work = "Hãy hoàn thành tất cả công việc trước đã",
        vehicle_not_correct = "Đây không phải là phương tiện đúng yêu cầu",
        failed = "Bạn đã thất bại",
        not_towing_vehicle = "Bạn phải ở trong xe kéo",
        too_far_away = "Bạn đang ở quá xa",
        no_work_done = "Bạn chưa làm bất kỳ công việc nào",
        no_deposit = "Cần đặt cọc $%{value}",
    },
    success = {
        paid_with_cash = "Đã đặt cọc $%{value} bằng tiền mặt",
        paid_with_bank = "Đã đặt cọc $%{value} từ ngân hàng",
        refund_to_cash = "Đã hoàn lại $%{value} bằng tiền mặt",
        you_earned = "Bạn đã kiếm được $%{value}",
    },
    menu = {
        header = "Danh sách xe kéo có sẵn",
        close_menu = "⬅ Đóng menu",
    },
    mission = {
        delivered_vehicle = "Bạn đã giao xe thành công",
        get_new_vehicle = "Có thể nhận xe mới",
        towing_vehicle = "Đang kéo xe...",
        goto_depot = "Đưa xe về bãi Hayes",
        vehicle_towed = "Đã kéo xe",
        untowing_vehicle = "Đang tháo xe xuống",
        vehicle_takenoff = "Xe đã được gỡ khỏi xe kéo",
    },
    info = {
        tow = "Kéo một chiếc xe lên thùng xe của bạn",
        toggle_npc = "Bật/tắt công việc NPC",
        skick = "Phát hiện hành vi gian lận",
    },
    label = {
        payslip = "Phiếu lương",
        vehicle = "Phương tiện",
        npcz = "Khu NPC",
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
