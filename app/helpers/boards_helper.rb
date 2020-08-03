module BoardsHelper
  def display_bm(board)
    if board.users.count == 0
      "徵求中"
    else
      board.users.each do |user|
        return user.account
      end
    end
  end
end
