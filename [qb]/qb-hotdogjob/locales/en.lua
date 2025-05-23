local Translations = {
    error = {
        no_money = 'Không đủ tiền',
        too_far = 'Bạn đang quá xa quầy bán Hotdog của mình',
        no_stand = 'Bạn không có quầy bán hotdog',
        cust_refused = 'Khách hàng đã từ chối!',
        no_stand_found = 'Không tìm thấy quầy hotdog của bạn, bạn sẽ không được hoàn trả tiền đặt cọc!',
        no_more = 'Bạn không còn %{value}, vấn đề này sẽ được đưa ra trước hội đồng',
        deposit_notreturned = 'Bạn không có quầy bán hotdog',
        no_dogs = 'Bạn không còn chiếc hotdog nào',
    },
    success = {
        deposit = 'Bạn đã đặt cọc $%{deposit}!',
        deposit_returned = 'Tiền đặt cọc $%{deposit} của bạn đã được hoàn trả!',
        sold_hotdogs = '%{value} x Hotdog đã bán với giá $%{value2}',
        made_hotdog = 'Bạn đã làm %{value} cái Hotdog',
        made_luck_hotdog = 'Bạn đã làm %{value} x %{value2} cái Hotdog',
    },
    info = {
        command = "Xóa Quầy (Chỉ Admin)",
        blip_name = 'Quầy Hotdog',
        start_working = '[E] Bắt đầu làm việc',
        start_work = 'Bắt đầu làm việc',
        stop_working = '[E] Dừng làm việc',
        stop_work = 'Dừng làm việc',
        grab_stall = '[~g~G~s~] Nhặt quầy',
        drop_stall = '[~g~G~s~] Thả quầy',
        grab = 'Nhặt quầy',
        prepare = 'Chuẩn bị Hotdog',
        toggle_sell = 'Chuyển trạng thái bán',
        selling_prep = '[~g~E~s~] Chuẩn bị hotdog [Trạng thái: ~g~Đang bán~w~]',
        not_selling = '[~g~E~s~] Chuẩn bị hotdog [Trạng thái: ~r~Không bán~w~]',
        sell_dogs = '[~g~7~s~] Bán %{value} x Hotdog với giá $%{value2} / [~g~8~s~] Từ chối',
        sell_dogs_target = 'Bán %{value} x Hotdog với giá $%{value2}',
        admin_removed = "Quầy hotdog đã bị xóa",
        label_a = "Hoàn hảo (A)",
        label_b = "Hiếm (B)",
        label_c = "Phổ biến (C)"
    },
    keymapping = {
        gkey = 'Thả quầy hotdog',
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
