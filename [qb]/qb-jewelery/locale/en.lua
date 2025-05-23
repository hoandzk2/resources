local Translations = {
    error = {
        fingerprints = 'Bạn đã để lại dấu vân tay trên tủ kính',
        minimum_police = 'Cần ít nhất %{value} cảnh sát để thực hiện',
        wrong_weapon = 'Vũ khí của bạn không đủ mạnh...',
        to_much = 'Bạn đang mang quá nhiều đồ trong túi'
    },
    success = {
        -- Nếu có thông báo thành công nào, bạn có thể thêm ở đây
    },
    info = {
        progressbar = 'Đang đập vỡ tủ trưng bày đợi chút',
    },
    general = {
        target_label = 'Đập vỡ tủ trưng bày',
        drawtextui_grab = '[E] Đập vỡ tủ trưng bày',
        drawtextui_broken = 'Tủ trưng bày đã bị vỡ'
    }
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
