module PostsHelper
  def fulltitle(page_title = "")
    basetitle = "RorMedia"
    if page_title.empty?
      basetitle
    else
      "#{page_title} | #{basetitle}"
    end
  end



  # Private Links
  def private_links(post)
    if user_signed_in? && post.user_id == current_user.id
      concat link_to  "Edit", edit_post_path(post), class: 'btn btn-sm btn-primary rounded-0 mr-1'
      link_to  "Delete", post_path(post), method: :delete, data: {Confirm: "Are you sure?"}, class: 'btn btn-sm btn-danger rounded-0'
    end
  end
end
