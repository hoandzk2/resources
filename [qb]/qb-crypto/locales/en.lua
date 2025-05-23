local Translations = {
    error = {
        you_dont_have_a_cryptostick = 'Bạn không có thiết bị cryptostick',
        cryptostick_malfunctioned = 'Thiết bị cryptostick bị lỗi'
    },
    success = {
        you_have_exchanged_your_cryptostick_for = 'Bạn đã đổi cryptostick lấy: %{amount} QBit'
    },
    credit = {
        there_are_amount_credited = 'Bạn đã được cộng %{amount} QBit!',
        you_have_qbit_purchased = 'Bạn đã mua %{dataCoins} QBit!'
    },
    debit = {
        you_have_sold = 'Bạn đã bán %{dataCoins} QBit!'
    },
    text = {
        enter_usb = '[E] - Kết nối USB',
        system_is_rebooting = 'Hệ thống đang khởi động lại - %{rebootInfoPercentage}%',
        you_have_not_given_a_new_value = 'Bạn chưa nhập giá trị mới... Giá trị hiện tại: %{crypto}',
        this_crypto_does_not_exist = 'Loại tiền mã hóa này không tồn tại, chỉ có: QBit',
        you_have_not_provided_crypto_available_qbit = 'Bạn chưa cung cấp loại tiền mã hóa, hiện có: QBit',
        the_qbit_has_a_value_of = 'QBit hiện có giá trị: %{crypto}',
        you_have_with_a_value_of = 'Bạn đang có %{playerPlayerDataMoneyCrypto} QBit với tổng giá trị: %{mypocket},-'
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
