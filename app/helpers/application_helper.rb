module ApplicationHelper
  def list_makes(name = "make", use_id = false)
    if use_id
      select_tag name, options_from_collection_for_select(Make.all, "id", "name"), :include_blank => true
    else  
      select_tag name, options_from_collection_for_select(Make.all, "name", "name"), :include_blank => true
    end
  end
end
