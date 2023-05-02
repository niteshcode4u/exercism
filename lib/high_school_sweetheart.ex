defmodule HighSchoolSweetheart do
  @spec first_letter(String.t()) :: String.t()
  def first_letter(name) do
    name
    |> String.trim()
    |> String.codepoints()
    |> hd()
  end

  @spec initial(String.t()) :: String.t()
  def initial(name) do
    name
    |> first_letter()
    |> String.upcase()
    |> Kernel.<>(".")
  end

  @spec initials(String.t()) :: String.t()
  def initials(full_name) do
    [first_name, last_name] = String.split(full_name, " ")
    first_name_initial = initial(first_name)
    last_name_initial = initial(last_name)

    first_name_initial <> " " <> last_name_initial
  end

  @spec pair(String.t(), String.t()) :: String.t()
  def pair(full_name1, full_name2) do
    #      ******       ******
    #    **      **   **      **
    #  **         ** **         **
    # **            *            **
    # **                         **
    # **     X. X.  +  X. X.     **
    #  **                       **
    #    **                   **
    #      **               **
    #        **           **
    #          **       **
    #            **   **
    #              ***
    #               *

    f1 = initials(full_name1)
    f2 = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{f1}  +  #{f2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
