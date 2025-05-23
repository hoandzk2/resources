local Translations = {
    error = {
        process_canceled = "Đã hủy quá trình",
        plant_has_died = "Cây đã chết. Nhấn ~r~ E ~w~ để xóa cây.",
        cant_place_here = "Không thể đặt tại đây",
        not_safe_here = "Chỗ này không an toàn, hãy thử ở nhà của bạn",
        not_need_nutrition = "Cây không cần thêm dinh dưỡng",
        this_plant_no_longer_exists = "Cây này không còn tồn tại?",
        house_not_found = "Không tìm thấy ngôi nhà",
        you_dont_have_enough_resealable_bags = "Bạn không có đủ túi khóa kéo",
    },
    text = {
        sort = "Sắp xếp:",
        harvest_plant = "Nhấn ~g~ [E] ~w~ để thu hoạch cây.",
        nutrition = "Dinh dưỡng:",
        health = "Sức khỏe:",
        progress = "Tiến độ:",
        harvesting_plant = "Đang thu hoạch cây",
        planting = "Đang trồng cây",
        feeding_plant = "Đang bón phân cho cây",
        the_plant_has_been_harvested = "Cây đã được thu hoạch",
        removing_the_plant = "Đang xóa cây",
        stage = "Giai đoạn hiện tại:",
        highestStage = "Giai đoạn thu hoạch:",
    },
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
