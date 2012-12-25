module ApplicationHelper
  def list_makes
    makes = [Make.new(:name => ""), Make.all]
    select_tag "make", options_from_collection_for_select(makes.flatten, "name", "name")
  end
end
