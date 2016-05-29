module DiaryHelper
  def next_day(date)
    if date.advance(days: 1).future? && date.advance(days: 1) != Date.today
      link_to "Next", diaries_path(date: date.advance(days: 1).to_s), class: 'btn btn-sm btn-default', disabled: true
    else
      link_to "Next", diaries_path(date: date.advance(days: 1).to_s), class: 'btn btn-sm btn-default'
    end
  end

  def prev_day(date)
    link_to "Previous", diaries_path(date: date.advance(days: -1)).to_s, class: 'btn btn-sm btn-default'
  end
end
