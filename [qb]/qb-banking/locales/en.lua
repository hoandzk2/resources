local Translations = {
    success = {
        withdraw = 'Rút tiền thành công',
        deposit = 'Gửi tiền thành công',
        transfer = 'Chuyển tiền thành công',
        account = 'Đã tạo tài khoản',
        rename = 'Đã đổi tên tài khoản',
        delete = 'Đã xoá tài khoản',
        userAdd = 'Đã thêm người dùng',
        userRemove = 'Đã xoá người dùng',
        card = 'Đã tạo thẻ',
        give = 'Đã đưa $%s tiền mặt',
        receive = 'Đã nhận $%s tiền mặt',
    },
    error = {
        error = 'Đã xảy ra lỗi',
        access = 'Không có quyền truy cập',
        account = 'Không tìm thấy tài khoản',
        accounts = 'Đã tạo tối đa số tài khoản cho phép',
        user = 'Người dùng đã được thêm trước đó',
        noUser = 'Không tìm thấy người dùng',
        money = 'Không đủ tiền',
        pin = 'Mã PIN không hợp lệ',
        card = 'Không tìm thấy thẻ ngân hàng',
        amount = 'Số tiền không hợp lệ',
        toofar = 'Bạn đang đứng quá xa',
    },
    progress = {
        atm = 'Đang truy cập ATM',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
