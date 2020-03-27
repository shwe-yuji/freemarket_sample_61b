class Status < ActiveHash::Base
  self.data = [
      { id: 1, value: '出品中' },
      { id: 2, value: '交渉中' },
      { id: 3, value: '出品停止中' },
      { id: 4, value: '購入済み' }
    ]

  def self.get_status(status_id)
    if status_id == [""]
      (1..Status.all.length).to_a
    else
      status_id
    end
  end
end 