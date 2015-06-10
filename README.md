## ForkEm

### Models
- Relationships
  - Mealbook
    - ``` belongs_to :owner ```
    - ``` has_many :meals ```
  - Meal
    - ``` belongs_to :mealbook ```
    - ``` has_many :ingredients ```




