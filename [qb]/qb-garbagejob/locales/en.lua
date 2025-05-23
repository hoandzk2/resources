local Translations = {
    error = {
        ["cancled"] = "Đã hủy",
        ["no_truck"] = "Bạn không có xe rác!",
        ["not_enough"] = "Không đủ tiền (Cần %{value})",
        ["too_far"] = "Bạn đang quá xa điểm giao rác",
        ["early_finish"] = "Do hoàn thành sớm (Hoàn thành: %{completed} / Tổng: %{total}), bạn sẽ không được hoàn trả tiền đặt cọc.",
        ["never_clocked_on"] = "Bạn chưa bắt đầu ca làm việc!",
        ["all_occupied"] = "Tất cả các chỗ đỗ đều đã đầy",
        ["job"] = "Bạn phải nhận công việc từ trung tâm việc làm",
    },
    success = {
        ["clear_routes"] = "Đã xóa tuyến đường của người chơi, họ có %{value} tuyến đã lưu",
        ["pay_slip"] = "Bạn nhận được $%{total}, bảng lương của bạn $%{deposit} đã được chuyển vào tài khoản ngân hàng!",
    },
    target = {
        ["talk"] = "Nói chuyện với nhân viên thu gom rác",
        ["grab_garbage"] = "Lấy túi rác",
        ["dispose_garbage"] = "Bỏ túi rác",
    },
    menu = {
        ["header"] = "Menu chính công việc thu gom rác",
        ["collect"] = "Nhận bảng lương",
        ["return_collect"] = "Trả xe và nhận bảng lương tại đây!",
        ["route"] = "Yêu cầu tuyến đường",
        ["request_route"] = "Yêu cầu một tuyến đường thu gom rác",
    },
    info = {
        ["payslip_collect"] = "[E] - Nhận bảng lương",
        ["payslip"] = "Bảng lương",
        ["not_enough"] = "Bạn không có đủ tiền để đặt cọc.. Chi phí đặt cọc là $%{value}",
        ["deposit_paid"] = "Bạn đã đặt cọc $%{value}!",
        ["no_deposit"] = "Bạn chưa đặt cọc cho phương tiện này..",
        ["truck_returned"] = "Xe đã được trả, nhận bảng lương để nhận lương và tiền đặt cọc!",
        ["bags_left"] = "Vẫn còn %{value} túi rác!",
        ["bags_still"] = "Vẫn còn %{value} túi rác ở đó!",
        ["all_bags"] = "Đã gom hết túi rác, di chuyển đến địa điểm tiếp theo!",
        ["depot_issue"] = "Có vấn đề xảy ra tại bãi xe, hãy quay lại ngay!",
        ["done_working"] = "Bạn đã hoàn thành công việc! Quay lại bãi xe.",
        ["started"] = "Bạn đã bắt đầu làm việc, vị trí đã được đánh dấu trên GPS!",
        ["grab_garbage"] = "[E] Lấy túi rác",
        ["stand_grab_garbage"] = "Đứng tại đây để lấy túi rác.",
        ["dispose_garbage"] = "[E] Bỏ túi rác",
        ["progressbar"] = "Đang bỏ túi rác vào xe ..",
        ["garbage_in_truck"] = "Bỏ túi rác vào xe tải của bạn..",
        ["stand_here"] = "Đứng tại đây..",
        ["found_crypto"] = "Bạn nhặt được một thẻ mã hóa trên đường",
        ["payout_deposit"] = "(+ $%{value} tiền đặt cọc)",
        ["store_truck"] =  "[E] - Cất xe rác",
        ["get_truck"] =  "[E] - Nhận xe rác",
        ["picking_bag"] = "Đang nhặt túi rác..",
        ["talk"] = "[E] Nói chuyện với nhân viên thu gom rác",
    },
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
