class OutputItemOutputController < Shirka::Qt::TreeItemController
  def init(data)
    @data.chop! while @data[-1]=="\n"
  end
end