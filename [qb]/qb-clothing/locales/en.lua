local Translations = {
    store = {
        barber = "Tiệm cắt tóc",
        surgeon = "Phẫu thuật thẩm mỹ",
        clothing = "Cửa hàng quần áo",
        outfitchanger = "Thay đổi trang phục"
    },

    outfits = {
        roomOutfits = "Trang phục có sẵn",
        myOutfits = "Trang phục của tôi",
        character = "Quần áo",
        accessoires = "Phụ kiện"
    },

    menu = {
        hair = "Tóc",
        character = "Quần áo",
        accessoires = "Phụ kiện",
        features = "Đặc điểm"
    },

    ui = {
        select = "Chọn",
        delete = "Xoá",
        select_outfit = "Chọn trang phục",
        player_model = "Mẫu nhân vật",
        model = "Mẫu",
        mother = "Mẹ",
        father = "Cha",
        texture = "Kết cấu",
        type = "Loại",
        item = "Mục",
        skin_color = "Màu da",
        parent_mixer = "Trộn gen",
        shape_mix = "Tỉ lệ hình dáng",
        skin_mix = "Tỉ lệ màu da",
        arms = "Tay",
        undershirt = "Áo trong/Thắt lưng",
        color = "Màu sắc",
        jacket = "Áo khoác/Áo ngoài",
        vests = "Áo gi-lê",
        decals = "Hình xăm/Tem dán",
        acessory = "Phụ kiện cổ",
        bags = "Ba lô/Túi",
        pants = "Quần",
        shoes = "Giày",
        eye_color = "Màu mắt",
        moles = "Nốt ruồi/Tàn nhang",
        opacity = "Độ trong suốt",
        nose_width = "Chiều rộng mũi",
        width = "Chiều rộng",
        nose_peak_height = "Độ cao đầu mũi",
        height = "Chiều cao",
        nose_peak_length = "Chiều dài đầu mũi",
        length = "Chiều dài",
        nose_bone_height = "Chiều cao xương mũi",
        nose_peak_lowering = "Hạ thấp đầu mũi",
        lowering = "Hạ thấp",
        nose_bone_twist = "Xoay xương mũi",
        twist = "Xoay",
        eyebrow_height = "Độ cao chân mày",
        eyebrow_depth = "Độ sâu chân mày",
        depth = "Chiều sâu",
        cheeks_height = "Độ cao má",
        cheeks_width = "Độ rộng má",
        cheeks_depth = "Độ sâu má",
        eyes_opening = "Độ mở mắt",
        opening = "Mở",
        lips_thickness = "Độ dày môi",
        thickness = "Độ dày",
        jaw_bone_width = "Chiều rộng hàm",
        jaw_bone_length = "Chiều dài hàm",
        chin_height = "Độ cao cằm",
        chin_width = "Độ rộng cằm",
        butt_chin = "Cằm chẻ",
        size = "Kích thước",
        neck_thickness = "Độ dày cổ",
        ageing = "Lão hóa",
        hair = "Tóc",
        eyebrow = "Chân mày",
        facial_hair = "Râu",
        lipstick = "Son môi",
        blush = "Phấn má",
        makeup = "Trang điểm",
        mask = "Mặt nạ",
        hat = "Mũ",
        glasses = "Kính",
        ear_accessories = "Phụ kiện tai",
        watch = "Đồng hồ",
        bracelet = "Vòng tay",
        btn_confirm = "Xác nhận",
        btn_cancel = "Hủy",
        btn_saveOutfit = "Lưu trang phục",
        outfit_name = "Tên trang phục"
    },

    notify = {
        error_bracelet = "Bạn không thể tháo vòng chân...",
        info_deleteOutfit = "Bạn đã xoá trang phục %{outfit}!"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
