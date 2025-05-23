-- Dịch bởi ChatGPT
local Translations = {
    headers = {
        ['bsm'] = 'Quản Lý Công Ty - ',
    },
    body = {
        ['manage'] = 'Quản Lý Nhân Viên',
        ['managed'] = 'Xem danh sách nhân viên',
        ['hire'] = 'Tuyển Nhân Viên',
        ['hired'] = 'Tuyển người dân gần đó',
        ['storage'] = 'Kho Lưu Trữ',
        ['storaged'] = 'Mở kho lưu trữ',
        ['outfits'] = 'Trang Phục',
        ['outfitsd'] = 'Xem trang phục đã lưu',
        ['money'] = 'Quản Lý Tài Chính',
        ['moneyd'] = 'Xem số dư công ty',
        ['mempl'] = 'Quản Lý Nhân Viên - ',
        ['mngpl'] = 'Quản lý ',
        ['grade'] = 'Cấp bậc: ',
        ['fireemp'] = 'Sa Thải Nhân Viên',
        ['hireemp'] = 'Tuyển Nhân Viên - ',
        ['cid'] = 'Mã Công Dân: ',
        ['balance'] = 'Số dư: $',
        ['deposit'] = 'Nạp Tiền',
        ['depositd'] = 'Nạp tiền vào tài khoản',
        ['withdraw'] = 'Rút Tiền',
        ['withdrawd'] = 'Rút tiền từ tài khoản',
        ['depositm'] = 'Nạp tiền <br> Số dư hiện tại: $',
        ['withdrawm'] = 'Rút tiền <br> Số dư hiện tại: $',
        ['submit'] = 'Xác Nhận',
        ['amount'] = 'Số Tiền',
        ['return'] = 'Quay Lại',
        ['exit'] = 'Thoát',
    },
    drawtext = {
        ['label'] = '[E] Quản Lý Công Việc',
    },
    target = {
        ['label'] = 'Menu Boss',
    },
    headersgang = {
        ['bsm'] = 'Quản Lý Băng Đảng - ',
    },
    bodygang = {
        ['manage'] = 'Quản Lý Thành Viên',
        ['managed'] = 'Tuyển hoặc sa thải thành viên',
        ['hire'] = 'Tuyển Thành Viên',
        ['hired'] = 'Tuyển người vào băng đảng',
        ['storage'] = 'Kho Băng Đảng',
        ['storaged'] = 'Mở kho của băng đảng',
        ['outfits'] = 'Trang Phục',
        ['outfitsd'] = 'Thay đổi trang phục',
        ['money'] = 'Quản Lý Tài Chính',
        ['moneyd'] = 'Xem số dư của băng đảng',
        ['mempl'] = 'Quản Lý Thành Viên - ',
        ['mngpl'] = 'Quản lý ',
        ['grade'] = 'Cấp bậc: ',
        ['fireemp'] = 'Sa Thải',
        ['hireemp'] = 'Tuyển Thành Viên - ',
        ['cid'] = 'Mã Công Dân: ',
        ['balance'] = 'Số dư: $',
        ['deposit'] = 'Nạp Tiền',
        ['depositd'] = 'Nạp tiền vào tài khoản',
        ['withdraw'] = 'Rút Tiền',
        ['withdrawd'] = 'Rút tiền từ tài khoản',
        ['depositm'] = 'Nạp tiền <br> Số dư hiện tại: $',
        ['withdrawm'] = 'Rút tiền <br> Số dư hiện tại: $',
        ['submit'] = 'Xác Nhận',
        ['amount'] = 'Số Tiền',
        ['return'] = 'Quay Lại',
        ['exit'] = 'Thoát',
    },
    drawtextgang = {
        ['label'] = '[E] Quản Lý Băng Đảng',
    },
    targetgang = {
        ['label'] = 'Menu Băng Đảng',
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
