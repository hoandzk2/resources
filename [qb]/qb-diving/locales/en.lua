local Translations = {
    error = {
        ["canceled"] = "Đã hủy",
        ["911_chatmessage"] = "TIN NHẮN 911",
        ["take_off"] = "Dùng lệnh /divingsuit để cởi đồ lặn",
        ["not_wearing"] = "Bạn hiện không mặc đồ lặn...",
        ["no_coral"] = "Bạn không có san hô để bán...",
        ["not_standing_up"] = "Bạn cần đứng dậy để mặc đồ lặn",
        ["need_otube"] = "Bạn cần một ống dưỡng khí để nạp vào đồ lặn",
        ["oxygenlevel"] = "Mức oxy của thiết bị là %{oxygenlevel}, phải là 0%"
    },
    success = {
        ["took_out"] = "Bạn đã cởi đồ lặn",
        ["tube_filled"] = "Đã nạp đầy ống dưỡng khí thành công"
    },
    info = {
        ["collecting_coral"] = "Đang thu thập san hô",
        ["diving_area"] = "Khu vực lặn",
        ["collect_coral"] = "Thu thập san hô",
        ["collect_coral_dt"] = "[E] - Thu thập san hô",
        ["checking_pockets"] = "Đang kiểm tra túi để bán san hô",
        ["sell_coral"] = "Bán san hô",
        ["sell_coral_dt"] = "[E] - Bán san hô",
        ["blip_text"] = "911 - Khu vực lặn",
        ["put_suit"] = "Mặc đồ lặn",
        ["pullout_suit"] = "Lấy ra một bộ đồ lặn...",
        ["cop_msg"] = "San hô này có thể là đồ trộm",
        ["cop_title"] = "Lặn biển bất hợp pháp",
        ["command_diving"] = "Cởi đồ lặn"
    },
    warning = {
        ["oxygen_one_minute"] = "Bạn còn dưới 1 phút oxy",
        ["oxygen_running_out"] = "Oxy trong đồ lặn sắp hết"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})