defmodule Attrition do
  @moduledoc """
  Documentation for `Attrition`.
  """

  @data_module Application.get_env(:attrition, :data_module, Attrition.Hide)
  def data_module, do: @data_module

  defmacro __using__(_opts) do
    quote do
      def data_qa(value) do
        Attrition.data_module().data_qa(value)
      end

      def data_test(string) do
        "data-test=\"#{string}\""
      end
    end
  end
  defmodule Hide do
    @doc """
    Returns empty string regardless of argument.
    """
    @spec data_qa(any) :: String.t()
    def data_qa(_), do: ""
  end

  defmodule Reveal do
    @doc """
    Returns correct string based on argument.
    """
    @spec data_qa(String.t) :: String.t
    def data_qa(string) do
      "data-qa=\"#{string}\""
    end
  end
end
