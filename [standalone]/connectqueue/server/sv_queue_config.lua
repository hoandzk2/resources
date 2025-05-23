Config = {}

-- Danh sách ưu tiên có thể là bất kỳ định danh nào. (steamid dạng hex, steamid32, địa chỉ IP)
-- Số nguyên thể hiện mức độ ưu tiên cao hơn so với người khác.
-- Nhiều trang web chuyển đổi SteamID hiện tại bị lỗi, bạn nên dùng https://steamid.xyz/
-- Bạn cũng có thể cấp quyền ưu tiên qua API, xem ví dụ/readme.
Config.Priority = {
    ["STEAM_0:1:0000####"] = 1,
    ["steam:110000######"] = 25,
    ["ip:127.0.0.0"] = 85
}

-- Yêu cầu người chơi phải mở Steam
Config.RequireSteam = true

-- Chỉ cho phép người có trong whitelist vào server
Config.PriorityOnly = false

-- Vô hiệu hóa giới hạn cứng (nên để true)
Config.DisableHardCap = true

-- Sẽ xóa người chơi khỏi hàng chờ nếu họ không load xong sau __ giây
-- Có thể cần tăng nếu có nhiều tài nguyên cần tải xuống
-- Đặt quá thấp có thể gây lỗi session, vì người chơi bị xóa có thể vẫn đang kết nối
-- 10 phút thường là đủ
Config.ConnectTimeOut = 600

-- Xóa người chơi khỏi hàng chờ nếu không có phản hồi trong __ giây
Config.QueueTimeOut = 90

-- Cấp quyền ưu tiên tạm thời khi người chơi disconnect hoặc đang loading vào game
Config.EnableGrace = false

-- Mức độ ưu tiên tạm thời
Config.GracePower = 5

-- Thời gian ưu tiên tạm thời (tính bằng giây)
Config.GraceTime = 480

-- Chống spam khi người chơi spam kết nối
Config.AntiSpam = false
Config.AntiSpamTimer = 30
Config.PleaseWait = "Vui lòng đợi %f giây. Kết nối sẽ bắt đầu tự động!"

-- Khi tài nguyên bắt đầu, cho phép người chơi vào hàng chờ nhưng không cho kết nối trong __ mili giây
-- Giúp ổn định hàng chờ và các tài nguyên khác kịp khởi tạo
Config.JoinDelay = 30000

-- Hiển thị số người đang có quyền ưu tiên tạm thời trong thông báo kết nối
Config.ShowTemp = false

-- Việt hóa giao diện người dùng
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Đang vào game...",
    connecting = "\xE2\x8F\xB3Đang kết nối...",
    idrr = "\xE2\x9D\x97[Hàng chờ] Lỗi: Không lấy được ID của bạn, vui lòng khởi động lại FiveM.",
    err = "\xE2\x9D\x97[Hàng chờ] Đã xảy ra lỗi.",
    pos = "\xF0\x9F\x90\x8CBạn đang ở vị trí %d/%d trong hàng chờ \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[Hàng chờ] Lỗi: Không thể thêm bạn vào danh sách kết nối",
    timedout = "\xE2\x9D\x97[Hàng chờ] Lỗi: Mất kết nối?",
    wlonly = "\xE2\x9D\x97[Hàng chờ] Bạn phải có trong whitelist để vào server này",
    steam = "\xE2\x9D\x97 [Hàng chờ] Lỗi: Bạn phải bật Steam"
}
