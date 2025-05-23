local Translations = {
    menus = {
        header = 'Bàn Chế Tạo',
        pickupworkBench = 'Nhặt bàn chế tạo',
        entercraftAmount = 'Nhập số lượng cần chế tạo:',
    },
    notifications = {
        pickupBench = 'Bạn đã nhặt bàn chế tạo.',
        invalidAmount = 'Số lượng không hợp lệ',
        invalidInput = 'Dữ liệu nhập vào không hợp lệ',
        notenoughMaterials = "Bạn không có đủ nguyên liệu!",
        craftingCancelled = 'Bạn đã hủy chế tạo',
        tablePlace = 'Bàn chế tạo đã được đặt',
        craftMessage = 'Bạn đã chế tạo thành công %s',
        xpGain = 'Bạn nhận được %d XP trong kỹ năng %s',
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
