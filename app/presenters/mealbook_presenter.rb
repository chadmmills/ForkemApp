class MealbookPresenter < SimpleDelegator

  def week_days
    (today.beginning_of_week.to_date..today.end_of_week.to_date).map do |day|
      Weekday.new(day, meal_for_weekday(day))
    end
  end

  def meals_with_no_assignment_for_current_week
    meals.where.not(id: current_week_meal_assignment_ids)
  end

  private

    def meal_for_weekday(day)
      current_week_meals.detect { |meal| meal.assigned_on == day }
    end

    def current_week_meals
      @_weekday_meals ||= meals.
                          joins(:meal_assignments).
                          select("meals.*").
                          select("meal_assignments.assigned_on")
    end

    def current_week_meal_assignment_ids
      meal_assignments.where(assigned_on: today.beginning_of_week..today.end_of_week).select(:meal_id)
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

      private

        attr_reader :weekday
    end
end
