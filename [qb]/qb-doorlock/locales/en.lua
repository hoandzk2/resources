local Translations = {
    error = {
        lockpick_fail = "Thất bại",
        door_not_found = "Không nhận được mã model, nếu cửa trong suốt, hãy chắc chắn rằng bạn đang nhắm vào khung cửa",
        same_entity = "Hai cửa không thể là cùng một thực thể",
        door_registered = "Cửa này đã được đăng ký",
        door_identifier_exists = "Đã tồn tại một cửa với mã định danh này trong cấu hình. (%s)",
    },
    success = {
        lockpick_success = "Thành công"
    },
    general = {
        locked = "Đã khóa",
        unlocked = "Đã mở khóa",
        locked_button = "[E] - Khóa",
        unlocked_button = "[E] - Mở khóa",
        keymapping_description = "Tương tác với khóa cửa",
        keymapping_remotetriggerdoor = "Kích hoạt từ xa cửa",
        locked_menu = "Đã khóa",
        pickable_menu = "Có thể mở bằng đồ nghề",
        cantunlock_menu = "Không thể mở",
        hidelabel_menu = "Ẩn nhãn cửa",
        distance_menu = "Khoảng cách tối đa",
        item_authorisation_menu = "Ủy quyền theo vật phẩm",
        citizenid_authorisation_menu = "Ủy quyền theo CitizenID",
        gang_authorisation_menu = "Ủy quyền theo Bang hội",
        job_authorisation_menu = "Ủy quyền theo Công việc",
        jobGrade_authorisation_menu = "Cấp bậc công việc (tùy chọn)",
        gangGrade_authorisation_menu = "Cấp bậc bang hội (tùy chọn)",
        doortype_title = "Loại cửa",
        doortype_door = "Cửa đơn",
        doortype_double = "Cửa đôi",
        doortype_sliding = "Cửa trượt đơn",
        doortype_doublesliding = "Cửa trượt đôi",
        doortype_garage = "Cửa gara",
        dooridentifier_title = "Mã định danh duy nhất",
        doorlabel_title = "Nhãn cửa",
        configfile_title = "Tên file cấu hình",
        submit_text = "Xác nhận",
        newdoor_menu_title = "Thêm cửa mới",
        newdoor_command_description = "Thêm một cửa mới vào hệ thống khóa cửa",
        doordebug_command_description = "Bật/Tắt chế độ debug",
        warning = "Cảnh báo",
        created_by = "tạo bởi",
        warn_no_permission_newdoor = "%{player} (%{license}) cố gắng thêm cửa mới mà không có quyền (nguồn: %{source})",
        warn_no_authorisation = "%{player} (%{license}) cố gắng mở cửa mà không có quyền (Gửi: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) cố gắng cập nhật cửa không hợp lệ (Gửi: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) cố gắng cập nhật sang trạng thái không hợp lệ (Gửi: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) gửi mã định danh cửa không hợp lệ (Gửi: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) đã mở cửa bằng quyền admin"
    }
}


Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})