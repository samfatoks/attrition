defmodule HideTest do
  alias Attrition.Hide
  use ExUnit.Case

  describe "data_qa/1" do
    test "with any value, returns empty string" do
      assert Hide.data_qa("test") == ""
      assert Hide.data_qa(1) == ""
      assert Hide.data_qa(:test) == ""
    end
  end
end
