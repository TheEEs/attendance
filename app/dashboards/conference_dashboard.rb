require "administrate/base_dashboard"

class ConferenceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    delegates: HasManyThroughField.with_options(
      limit: 10,
      sort_by: "name",
      direction: "desc"
    ),
    attends: Field::HasMany.with_options(
      limit: 7,
      sort_by: "attended",
      direction: "desc"
    ),
    locate: Field::String,
    name: Field::String,
    start_when: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    number_of_delegates: Field::Number
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    name
    locate
    number_of_delegates
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    locate
    start_when
    attends
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    locate
    start_when
    delegates
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how conferences are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(conference)
    conference.name.truncate 50
  end
end
