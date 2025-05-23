local Translations = {
    success = {
        tuned = 'Xe đã được độ',
        installed = '%s đã được lắp đặt',
        repaired = 'Xe đã được sửa chữa',
        part_repaired = '%s đã được sửa chữa',
        tire_repaired = 'Lốp đã được sửa',
        cleaned = 'Xe đã được rửa sạch',
    },
    warning = {
        not_tuned = 'Xe chưa được độ',
        no_materials = 'Không đủ nguyên liệu',
    },
    target = {
        duty = 'Bật/Tắt Trực',
        stash = 'Kho đồ',
        shop = 'Cửa hàng',
        paint = 'Sơn xe',
        withdraw = 'Lấy xe ra',
        deposit = 'Cất xe vào',
    },
    menu = {
        none = 'Không có',
        back = 'Quay lại',
        close = 'Đóng',
        submit = 'Xác nhận',
        status = 'Trạng thái',
        vehicle_stats = 'Thông số xe',
        engine_health = 'Độ bền động cơ',
        body_health = 'Độ bền thân xe',
        fuel_health = 'Độ bền bình xăng',
        vehicle_list = 'Danh sách xe',
        paint_vehicle = 'Sơn xe',
        radiator_repair = 'Sửa két nước',
        axle_repair = 'Sửa trục xe',
        fuel_repair = 'Sửa bình xăng',
        clutch_repair = 'Sửa ly hợp',
        brakes_repair = 'Sửa phanh',
        paints = 'Màu sơn',
        type = 'Loại',
        metallic = 'Sơn kim loại',
        matte = 'Sơn mờ',
        chrome = 'Sơn bóng',
        custom_color = 'Màu tuỳ chỉnh',
        section = 'Khu vực',
        primary = 'Chính',
        secondary = 'Phụ',
        pearlescent = 'Ánh ngọc trai',
        interior = 'Nội thất',
        exterior = 'Ngoại thất',
        wheels = 'Bánh xe',
        neons = 'Đèn neon',
        xenon = 'Đèn pha Xenon',
        window_tint = 'Dán kính xe',
        plate = 'Biển số',
        repair = 'Sửa chữa',
        unknown = 'Không rõ',
        tire_smoke = 'Khói lốp',
        standard = 'Tiêu chuẩn',
        custom = 'Tuỳ chỉnh',
        toggle = 'Bật/Tắt',
        enabled = 'Bật',
        disabled = 'Tắt',
        color = 'Màu',
        front_toggle = 'Bật/Tắt phía trước',
        rear_toggle = 'Bật/Tắt phía sau',
        left_toggle = 'Bật/Tắt bên trái',
        right_toggle = 'Bật/Tắt bên phải',
        stock = 'Mặc định',
        armor = 'Giáp cấp',
        brakes = 'Phanh cấp',
        engine = 'Động cơ cấp',
        transmission = 'Hộp số cấp',
        suspension = 'Giảm xóc cấp',
        turbo = 'Bộ tăng áp',
        install_turbo = 'Lắp bộ tăng áp',
        uninstall_turbo = 'Tháo bộ tăng áp',
    },
    progress = {
        nitrous = 'Đang lắp bình Nitrous',
        installing = 'Đang lắp %s',
        repairing = 'Đang sửa %s',
        repair_vehicle = 'Đang sửa xe',
        repair_tire = 'Đang sửa lốp',
        cleaning = 'Đang rửa xe',
        tuner_chip = 'Đang kết nối chip độ xe',
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
