class ItemDecorator < Draper::Decorator
  delegate_all

  def price
    "￥#{item.price}"
  end

  def tag_names
    item.tags.map(&:name).join(',')
  end
end
