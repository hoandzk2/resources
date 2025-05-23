local Translations = {
    notify = {
        ["hud_settings_loaded"] = "Cài đặt HUD đã được tải!",
        ["hud_restart"] = "HUD đang khởi động lại!",
        ["hud_start"] = "HUD đã được khởi động!",
        ["hud_command_info"] = "Lệnh này sẽ đặt lại các cài đặt HUD hiện tại của bạn!",
        ["load_square_map"] = "Đang tải bản đồ vuông...",
        ["loaded_square_map"] = "Bản đồ vuông đã được tải!",
        ["load_circle_map"] = "Đang tải bản đồ tròn...",
        ["loaded_circle_map"] = "Bản đồ tròn đã được tải!",
        ["cinematic_on"] = "Chế độ điện ảnh đã bật!",
        ["cinematic_off"] = "Chế độ điện ảnh đã tắt!",
        ["engine_on"] = "Động cơ đã khởi động!",
        ["engine_off"] = "Động cơ đã tắt!",
        ["low_fuel"] = "Nhiên liệu sắp hết!",
        ["access_denied"] = "Bạn không có quyền truy cập!",
        ["stress_gain"] = "Cảm thấy căng thẳng hơn!",
        ["stress_removed"] = "Cảm thấy thư giãn hơn!"
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
