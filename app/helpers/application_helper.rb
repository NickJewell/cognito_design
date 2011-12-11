module ApplicationHelper
  # Return a title on a per-page basis.
  def title 
    base_title = "Cognito App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("Cognito_Logo.jpg", :alt => "Cognito App", :class => "round", :size => "200x100")
  end
end
