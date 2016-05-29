class DiariesController < ApplicationController
  before_filter :authenticate_user!
  def index
    raise ArgumentError if date.future? && date != Date.today
    @diary_entry = DiaryEntry.find_or_create_by(date: date, user_id: current_user.id)
  end

  def new
    @diary_entry = DiaryEntry.find(params[:entry_id])
    if @diary_entry.user != current_user
      raise ActiveRecord::RecordNotFound.new(params[:entry_id])
    end
  end

  def create
    @diary_entry = DiaryEntry.find(params[:entry_id])
    if @diary_entry.user != current_user
      raise ActiveRecord::RecordNotFound.new(params[:entry_id])
    end
    RecordedFood.new.tap do |food|
      food.food_id = params[:food][:id]
      food.diary_entry_id = @diary_entry.id
      food.part_of_day = params[:food][:part_of_day]
      food.save!
    end

    redirect_to diaries_path(date: @diary_entry.date), notice: "Added new food."
  end

  def current_date
    Date.today
  end

  def date
    Date.parse(params[:date])
  rescue ArgumentError, TypeError
    Date.today
  end
end
