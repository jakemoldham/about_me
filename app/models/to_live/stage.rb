class ToLive::Stage < ActiveRecord::Base
  has_many :questions

  def self.rand_questions
    arr = ToLive::Question.all.pluck(:id)
    arr.shuffle
  end

  def self.set_stage(stage)
    if stage == 1 || stage == 2
      ToLive::Stage.first
    elsif stage == 3 || stage == 4
      ToLive::Stage.second
    elsif stage == 5 || stage == 6
      ToLive::Stage.third
    elsif stage == 7 || stage == 8
      ToLive::Stage.fourth
    elsif stage == 9 || stage == 10
      ToLive::Stage.fifth
    else
      ToLive::Stage.find_by(id: 6)
    end
  end

  def self.set_player(p)
    if p.count.even?
      ToLive::Player.first
    else
      ToLive::Player.second
    end
  end

  def self.set_win_player(p)
    if p == ToLive::Player.first
      p = ToLive::Player.second
    else
      p = ToLive::Player.first
    end
  end
  
  # def self.next_stage(session)
  #   if session.id == 1
  #     ToLive::Stage.first
  #   else
  #     ToLive::Stage.where('id > ?', session.id).first
  #   end
  # end
end
