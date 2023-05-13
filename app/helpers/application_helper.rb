# frozen_string_literal: true

module ApplicationHelper
  def item_borders(collection_counter, collection_size)
    if collection_size == 1 || collection_counter.zero?
      'border'
    else
      'border-l border-r border-b'
    end
  end

  def item_rounded_corners(collection_counter, collection_size)
    if collection_counter.zero?
      'rounded-t'
    elsif collection_counter == collection_size - 1
      'rounded-b'
    end
  end
end
