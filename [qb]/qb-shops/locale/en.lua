local Translations = {
    info = {
<<<<<<< Updated upstream
        open_shop = '[E] Cửa Hàng',
        deliver_e = '~g~E~w~ - Deliver Products',
        deliver = 'Deliver Products',
=======
        open_shop = '[E] Mở cửa hàng',
        deliver_e = '~g~E~w~ - Giao hàng',
        deliver = 'Giao hàng',
>>>>>>> Stashed changes
    },
    error = {
        missing_license = 'Thiếu giấy phép %s cho một số sản phẩm',
        no_deposit = 'Cần đặt cọc $%{value}',
        cancelled = 'Đã hủy',
        vehicle_not_correct = 'Đây không phải là xe giao hàng!',
        no_driver = 'Bạn phải là người lái xe để làm điều này..',
        no_work_done = 'Bạn chưa làm việc gì cả..',
        backdoors_not_open = 'Cửa sau của xe chưa mở',
        get_out_vehicle = 'Bạn cần xuống xe để thực hiện hành động này',
        too_far_from_trunk = 'Bạn cần lấy hàng từ cốp xe',
        too_far_from_delivery = 'Bạn cần lại gần điểm giao hàng hơn'
    },
    success = {
        dealer_verify = 'Người bán đã kiểm tra giấy phép của bạn',
        paid_with_cash = 'Đã đặt cọc $%{value} bằng tiền mặt',
        paid_with_bank = 'Đã đặt cọc $%{value} từ tài khoản ngân hàng',
        refund_to_cash = 'Đã hoàn tiền đặt cọc $%{value} bằng tiền mặt',
        you_earned = 'Bạn đã kiếm được $%{value}',
        payslip_time = 'Bạn đã đến tất cả cửa hàng .. Đã đến lúc nhận lương!',
    },
    mission = {
        store_reached = 'Đã đến cửa hàng, lấy hộp hàng từ cốp xe bằng [E] và giao đến vị trí đánh dấu',
        take_box = 'Lấy một hộp hàng',
        deliver_box = 'Giao một hộp hàng',
        another_box = 'Lấy thêm một hộp hàng',
        goto_next_point = 'Bạn đã giao xong hàng, đến điểm tiếp theo',
        return_to_station = 'Bạn đã giao xong hàng, trở về trạm',
        job_completed = 'Bạn đã hoàn thành tuyến giao hàng'
    },
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
