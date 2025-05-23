local Translations = {
    notify = {
        ydhk = 'Bạn không có chìa khóa của phương tiện này.',
        nonear = 'Không có ai gần để trao chìa khóa.',
        vlock = 'Xe đã khóa!',
        vunlock = 'Xe đã mở khóa!',
        vlockpick = 'Bạn đã mở khóa cửa xe thành công!',
        fvlockpick = 'Bạn không tìm thấy chìa khóa và trở nên bực bội.',
        vgkeys = 'Bạn đã trao chìa khóa.',
        vgetkeys = 'Bạn đã nhận được chìa khóa của xe!',
        fpid = 'Vui lòng điền ID người chơi và biển số xe.',
        cjackfail = 'Cướp xe thất bại!',
        vehclose = 'Không có phương tiện nào gần!',
    },
    progress = {
        takekeys = 'Đang lấy chìa khóa từ thi thể...',
        hskeys = 'Đang tìm chìa khóa xe...',
        acjack = 'Đang cố gắng cướp xe...',
    },
    info = {
        skeys = '~g~[H]~w~ - Tìm chìa khóa',
        tlock = 'Khóa/Mở khóa xe',
        palert = 'Đang có hành vi trộm xe. Loại phương tiện: ',
        engine = 'Bật/Tắt động cơ',
    },
    addcom = {
        givekeys = 'Trao chìa khóa cho người khác. Nếu không có ID, sẽ đưa cho người gần nhất hoặc tất cả trong xe.',
        givekeys_id = 'id',
        givekeys_id_help = 'ID người chơi',
        addkeys = 'Thêm chìa khóa xe cho người khác.',
        addkeys_id = 'id',
        addkeys_id_help = 'ID người chơi',
        addkeys_plate = 'plate',
        addkeys_plate_help = 'Biển số xe',
        rkeys = 'Xóa quyền giữ chìa khóa xe của người chơi.',
        rkeys_id = 'id',
        rkeys_id_help = 'ID người chơi',
        rkeys_plate = 'plate',
        rkeys_plate_help = 'Biển số xe',
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
