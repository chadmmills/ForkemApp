class MealbookPresenter < SimpleDelegator

  def initialize(mealbook:, week:)
    __setobj__(mealbook)
    @week = week
  end

  def current_week_title
    first_day_of_week.strftime("%A - %B #{first_day_of_week.day.ordinalize}")
  end

  def first_day_of_week
    @week.beginning_of_week
  end

  def last_day_of_week
    @week.end_of_week
  end

  def week_range
    first_day_of_week..last_day_of_week
  end

  def prev_week
    (first_day_of_week - 1.week).to_date
  end

  def next_week
    (first_day_of_week + 1.week).to_date
  end
  
  def week_days
    week_range.map do |day|
      Weekday.new(day, meal_for_weekday(day))
    end
  end

  def available_meals
    meals.by_title
  end

  private

  def meal_for_weekday(day)
    current_week_meals.detect { |meal| meal.assigned_on == day }
  end

  def current_week_meals
    @_weekday_meals ||= current_week_meals_query
  end

  def current_week_meals_query
    meals.
      joins(:meal_assignments).
      select("meals.*").
      select("assigned_on").
      select("meal_assignments.id AS meal_assignment_id").
      where(
        meal_assignments: {
          assigned_on: week_range
        }
      )
  end

  class Weekday
    attr_reader :meal

    def initialize(week_day, meal)
      @weekday = week_day
      @meal = meal
    end

    def id
      title.downcase
    end

    def date
      weekday
    end

    def formatted_date
      weekday.strftime("%b #{weekday.day.ordinalize}")
    end

    def title
      weekday.strftime "%A"
    end

    def to_partial_path
      "week_day"
    end

    def assignment_id
      meal.try(:meal_assignment_id)
    end

    private

    attr_reader :weekday
  end
end
