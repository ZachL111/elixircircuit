defmodule ElixircircuitTest do
  use ExUnit.Case

  test "fixture decisions" do
    signal_case_1 = %{demand: 62, capacity: 91, latency: 19, risk: 25, weight: 9}
    assert Elixircircuit.score(signal_case_1) == 57
    assert Elixircircuit.classify(signal_case_1) == "review"
    signal_case_2 = %{demand: 62, capacity: 82, latency: 15, risk: 10, weight: 5}
    assert Elixircircuit.score(signal_case_2) == 116
    assert Elixircircuit.classify(signal_case_2) == "review"
    signal_case_3 = %{demand: 82, capacity: 101, latency: 11, risk: 11, weight: 4}
    assert Elixircircuit.score(signal_case_3) == 185
    assert Elixircircuit.classify(signal_case_3) == "accept"
  end
end
