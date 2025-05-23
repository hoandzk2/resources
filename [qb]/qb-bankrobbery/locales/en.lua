local Translations = {
    success = {
        success_message = "Thành công",
        fuses_are_blown = "Cầu chì đã bị đốt cháy",
        door_has_opened = "Cánh cửa đã mở"
    },
    error = {
        cancel_message = "Đã huỷ",
        safe_too_strong = "Có vẻ như két sắt quá chắc chắn...",
        missing_item = "Bạn còn thiếu một vật phẩm...",
        bank_already_open = "Ngân hàng đã được mở...",
        minimum_police_required = "Cần tối thiểu %{police} cảnh sát",
        security_lock_active = "Khoá an ninh đang hoạt động, không thể mở cửa vào lúc này",
        wrong_type = "%{receiver} đã không nhận đúng kiểu dữ liệu cho tham số '%{argument}'\nkiểu nhận được: %{receivedType}\ngiá trị nhận được: %{receivedValue}\n kiểu mong đợi: %{expected}",
        fuses_already_blown = "Cầu chì đã bị đốt cháy rồi...",
        event_trigger_wrong = "%{event}%{extraInfo} đã được kích hoạt khi điều kiện chưa được đáp ứng, nguồn: %{source}",
        missing_ignition_source = "Bạn còn thiếu nguồn phát lửa"
    },
    general = {
        breaking_open_safe = "Đang phá két sắt...",
        connecting_hacking_device = "Đang kết nối thiết bị hack...",
        fleeca_robbery_alert = "Cảnh báo cướp ngân hàng Fleeca",
        paleto_robbery_alert = "Cảnh báo cướp ngân hàng Blain County Savings",
        pacific_robbery_alert = "Cảnh báo cướp ngân hàng Pacific Standard",
        break_safe_open_option_target = "Phá két sắt",
        break_safe_open_option_drawtext = "[E] Phá két sắt",
        validating_bankcard = "Đang kiểm tra thẻ...",
        thermite_detonating_in_seconds = "Nhiệt chất sẽ phát nổ trong %{time} giây",
        bank_robbery_police_call = "10-90: Cướp ngân hàng"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
