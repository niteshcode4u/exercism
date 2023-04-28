defmodule PacmanPacmanRulesTest do
  use ExUnit.Case

  describe "eat_ghost?/2" do
    @tag task_id: 1
    test "ghost gets eaten" do
      assert PacmanRules.eat_ghost?(true, true)
    end

    @tag task_id: 1
    test "ghost does not get eaten because no power pellet active" do
      refute PacmanRules.eat_ghost?(false, true)
    end

    @tag task_id: 1
    test "ghost does not get eaten because not touching ghost" do
      refute PacmanRules.eat_ghost?(true, false)
    end

    @tag task_id: 1
    test "ghost does not get eaten because no power pellet is active, even if not touching ghost" do
      refute PacmanRules.eat_ghost?(false, false)
    end
  end

  describe "score?/2" do
    @tag task_id: 2
    test "score when eating dot" do
      assert PacmanRules.score?(false, true)
    end

    @tag task_id: 2
    test "score when eating power pellet" do
      assert PacmanRules.score?(true, false)
    end

    @tag task_id: 2
    test "no score when nothing eaten" do
      refute PacmanRules.score?(false, false)
    end
  end

  describe "lose?/2" do
    @tag task_id: 3
    test "lose if touching a ghost without a power pellet active" do
      assert PacmanRules.lose?(false, true)
    end

    @tag task_id: 3
    test "don't lose if touching a ghost with a power pellet active" do
      refute PacmanRules.lose?(true, true)
    end

    @tag task_id: 3
    test "don't lose if not touching a ghost" do
      refute PacmanRules.lose?(true, false)
    end
  end

  describe "win?/3" do
    @tag task_id: 4
    test "win if all dots eaten" do
      assert PacmanRules.win?(true, false, false)
    end

    @tag task_id: 4
    test "don't win if all dots eaten, but touching a ghost" do
      refute PacmanRules.win?(true, false, true)
    end

    @tag task_id: 4
    test "win if all dots eaten and touching a ghost with a power pellet active" do
      assert PacmanRules.win?(true, true, true)
    end
  end
end
