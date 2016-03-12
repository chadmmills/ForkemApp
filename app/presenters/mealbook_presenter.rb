class MealbookPresenter < SimpleDelegator

  def week_days
    (today.beginning_of_week.to_date..today.end_of_week.to_date).map do |day|
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
          assigned_on: today.beginning_of_week..today.end_of_week
        }
      )
  end

  def today
    Time.zone.now
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
