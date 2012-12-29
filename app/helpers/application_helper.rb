module ApplicationHelper
  def list_makes
    select_tag "make", options_from_collection_for_select(Make.all, "name", "name"), :include_blank => true
  end
end
