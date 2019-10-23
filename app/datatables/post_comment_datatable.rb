class PostCommentDatatable < ApplicationDatatable
  delegate :edit_post_comments_path, to: :@view

  private

  def data
    post_comments.map do |post_comment|
      [].tap do |column|
        column << post_comment.comment
        column << post_comment.post.title

        links = []
        links << link_to('Show', post_comment)
        #links << link_to('Edit', edit_post_comments_path(post_comment))
        links << link_to('Destroy', post_comment, method: :delete, data: { confirm: 'Are you sure?' })
        column << links.join(' | ')
      end
    end
  end

  def count
    PostComment.count
  end

  def total_entries
    post_comments.total_count
    # will_paginate
    # users.total_entries
  end

  def post_comments
    @post_comments ||= fetch_post_comments
  end

  def fetch_post_comments
    search_string = []
    columns.each do |term|
      search_string << "#{term} like :search"
    end

    # will_paginate
    # users = User.page(page).per_page(per_page)
    post_comments = PostComment.order("#{sort_column} #{sort_direction}")
    post_comments = post_comments.page(page).per(per_page)
    post_comments = post_comments.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
  end

  def columns
    %w(comment)
  end
end
