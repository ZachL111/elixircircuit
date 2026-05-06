defmodule Elixircircuit.DomainReviewTest do
  use ExUnit.Case

  test "domain review lane" do
    item = %{signal: 44, slack: 48, drag: 17, confidence: 47}
    assert Elixircircuit.DomainReview.score(item) == 132
    assert Elixircircuit.DomainReview.lane(item) == "watch"
  end
end
