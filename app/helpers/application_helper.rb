module ApplicationHelper
  def sort_arrow(sort_param)
    if sort_param == "price_asc"
      "<i class='fa-solid fa-arrow-up'></i>"
    elsif sort_param == "price_desc"
      "<i class='fa-solid fa-arrow-down'></i>"
    end
  end
end
