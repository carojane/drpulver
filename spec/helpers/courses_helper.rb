def select_date(date, css_selector)
  month_name = Date::MONTHNAMES.fetch(date.month)
  within css_selector do
    find("option[value='#{date.month}']", text: month_name).select_option
    find("option[value='#{date.day}']", text: date.day.to_s).select_option
    find("option[value='#{date.year}']").select_option
  end
end
